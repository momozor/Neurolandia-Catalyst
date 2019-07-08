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

sub migrate_db {
    my ($self) = @_;

    if ( $self->migrate != 0 || $self->migrate_and_populate != 0 ) {
        return 1
            if system( 'sqlite3 '
                . $self->sqlite_db_path . ' < '
                . $self->schema_sql_path ) == $EXIT_STATUS_OK;
    }
    else {
        return 0;
    }
}

sub populate_db {
    my ($self) = @_;

    if ( $self->migrate_and_populate != 0 ) {
        return 1
            if system( 'sqlite3 '
                . $self->sqlite_db_path . ' < '
                . $self->schema_sql_populate_path ) == $EXIT_STATUS_OK;
    }
    else {
        return 0;
    }
}

sub call_model_creator_helper {
    my ($self) = @_;
    my $full_sqlite_dsn = $self->_sqlite_dsn . $self->sqlite_db_path;
    my $create_helper_script_path = './script/neurolandia_catalyst_create.pl';

    if ( ( $self->use_carton == 0 ) ) {
        print "I DONT USE CARTON!";
        return
            system( 'perl '
                . $create_helper_script_path
                . ' model '
                . $self->model_name
                . ' DBIC::Schema '
                . $self->schema_name
                . ' create=static '
                . $full_sqlite_dsn
                . ' on_connect_do="PRAGMA foreign_keys = ON"' );
    }

    elsif ( ( $self->use_carton == 1 ) ) {
        print "I USE CARTON\n";
        return
            system( 'carton exec perl '
                . $create_helper_script_path
                . ' model '
                . $self->model_name
                . ' DBIC::Schema '
                . $self->schema_name
                . ' create=static '
                . $full_sqlite_dsn
                . ' on_connect_do="PRAGMA foreign_keys = ON"' );
    }
}

sub migrate_schema_and_model {
    my ($self) = @_;

    #my $full_sqlite_dsn = $self->_sqlite_dsn . $self->sqlite_db_path;

    if ( $self->migrate != 0 || $self->migrate_and_populate != 0 ) {
        return 1 if $self->call_model_creator_helper == $EXIT_STATUS_OK;
    }
    else {
        return 0;
    }
}

__PACKAGE__->meta->make_immutable;

1;
