package Neurolandia::Catalyst::CLI::Migration;
use MooseX::Modern;
use IPC::Cmd qw(can_run run);

extends 'Neurolandia::Catalyst::CLI';

has 'migrate' => (
    'is'    => 'rw',
    'isa'   => 'Bool',
    writer  => 'set_migrate',
    default => 0
);

has 'migrate_and_populate' => (
    is      => 'rw',
    isa     => 'Bool',
    writer  => 'set_migrate_and_populate',
    default => 0
);

has 'sqlite_db_path' =>
    ( is => 'rw', isa => 'Str', default => './var/database.db' );
has 'schema_sql_path' =>
    ( is => 'rw', isa => 'Str', default => './sql/NCSchema.sql' );
has 'schema_sql_populate_path' =>
    ( is => 'rw', isa => 'Str', default => './sql/NCSchemaPopulate.sql' );
has 'schema_name' => ( is => 'rw', isa => 'Str', default => 'NCSchema' );
has 'model_name'  => ( is => 'rw', isa => 'Str', default => 'NCModel' );
has '_sqlite_dsn' => ( is => 'ro', isa => 'Str', default => 'dbi:SQLite:' );

my $SQLITE_OK = can_run('sqlite3')
    or die "sqlite3 binary doesn't exist in PATH\n";

sub _full_sqlite_cmd {
    my ( $self, $sql_schema_type ) = @_;

    return
          $SQLITE_OK . ' '
        . $self->sqlite_db_path . ' < '
        . $sql_schema_type;
}

# create the tables
sub migrate_db {
    my ($self) = @_;

    if ( $self->migrate || $self->migrate_and_populate ) {
        my $result = $self->auto_execute(
            $self->_full_sqlite_cmd( $self->schema_sql_path ) );

        return $result;
    }
}

# populate the created tables
# should be called AFTER $self->migrate_db
sub populate_db {
    my ($self) = @_;

    my $result = $self->auto_execute(
        $self->_full_sqlite_cmd( $self->schema_sql_populate_path ) );

    return $result;
}

sub call_model_creator_helper {
    my ($self) = @_;

    my $full_sqlite_dsn = $self->_sqlite_dsn . $self->sqlite_db_path;
    my $create_helper_script_path = './script/neurolandia_catalyst_create.pl';

    my $result
        = $self->auto_execute( $create_helper_script_path
            . ' model '
            . $self->model_name
            . ' DBIC::Schema '
            . $self->schema_name
            . ' create=static '
            . $full_sqlite_dsn
            . ' on_connect_do="PRAGMA foreign_keys = ON"' );

    return $result;
}

sub migrate_schema_and_model {
    my ($self) = @_;

    if ( $self->migrate || $self->migrate_and_populate) {
        return $self->call_model_creator_helper;
    }
    else {
        return 0;
    }
}

__PACKAGE__->meta->make_immutable;

1;
