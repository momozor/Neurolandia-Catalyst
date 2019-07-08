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
has 'rollback' => ( 'is' => 'rw', 'isa' => 'Bool', default => 0 );
has 'sqlite_db_path' =>
    ( is => 'rw', isa => 'Str', default => './var/database.db' );
has 'schema_sql_path' =>
    ( is => 'rw', isa => 'Str', default => './sql/NCSchema.sql' );

sub migrate_db {
    my ($self) = @_;
    my $EXIT_STATUS_OK = 0;

    if ( $self->migrate != 0 ) {
        return 1
            if system( 'sqlite3 '
                . $self->sqlite_db_path . ' < '
                . $self->schema_sql_path ) == $EXIT_STATUS_OK;
    }
}

__PACKAGE__->meta->make_immutable;

1;
