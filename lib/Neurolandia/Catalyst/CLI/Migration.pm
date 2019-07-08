package Neurolandia::Catalyst::CLI::Migration;
use Moose;
use namespace::autoclean;

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

has 'rollback' => ( 'is' => 'rw', 'isa' => 'Bool', default => 0 );
has 'sqlite_db_path' =>
    ( is => 'rw', isa => 'Str', default => './var/database.db' );
has 'schema_sql_path' =>
    ( is => 'rw', isa => 'Str', default => './sql/NCSchema.sql' );
has 'schema_sql_populate_path' =>
    ( is => 'rw', isa => 'Str', default => './sql/NCSchemaPopulate.sql' );
has 'schema_name' => ( is => 'rw', isa => 'Str', default => 'NCSchema' );
has 'model_name'  => ( is => 'rw', isa => 'Str', default => 'NCModel' );
has 'db_user'     => ( is => 'rw', isa => 'Str', default => '' );
has 'db_password' => ( is => 'rw', isa => 'Str', default => '' );
has 'db_target'   => ( is => 'rw', isa => 'Str', default => 'sqlite' );
has '_supported_dbs_list' => (
    is      => 'ro',
    isa     => 'ArrayRef',
    default => sub {
        return [ 'sqlite', 'mysql' ];
    }
);
has '_sqlite_dsn' => ( is => 'ro', isa => 'Str', default => 'dbi:SQLite:' );

my $EXIT_STATUS_OK = 0;

# create the tables
sub migrate_db {
    my ($self) = @_;

    if ( $self->migrate == 1 || $self->migrate_and_populate == 1 ) {
        return 1
            if system( 'sqlite3 '
                . $self->sqlite_db_path . ' < '
                . $self->schema_sql_path ) == $EXIT_STATUS_OK;
    }
    else {
        return 0;
    }
}

# populate the created tables
# should be called AFTER $self->migrate_db
sub populate_db {
    my ($self) = @_;

    return 1
        if system( 'sqlite3 '
            . $self->sqlite_db_path . ' < '
            . $self->schema_sql_populate_path ) == $EXIT_STATUS_OK;
}

sub call_model_creator_helper {
    my ($self) = @_;
    my $full_sqlite_dsn = $self->_sqlite_dsn . $self->sqlite_db_path;
    my $create_helper_script_path = './script/neurolandia_catalyst_create.pl';
    my $perl_invoker              = 'perl ';

    if ( ( $self->use_carton == 1 ) ) {
        $perl_invoker = 'carton exec perl ';
    }

    return 1
        if system( $perl_invoker
            . $create_helper_script_path
            . ' model '
            . $self->model_name
            . ' DBIC::Schema '
            . $self->schema_name
            . ' create=static '
            . $full_sqlite_dsn
            . ' on_connect_do="PRAGMA foreign_keys = ON"' )
        == $EXIT_STATUS_OK;
}

sub migrate_schema_and_model {
    my ($self) = @_;

    if ( $self->migrate == 1 || $self->migrate_and_populate == 1 ) {
        $self->call_model_creator_helper;
    }
    else {
        return 0;
    }
}

__PACKAGE__->meta->make_immutable;

1;
