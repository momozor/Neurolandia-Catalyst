use strict;
use warnings;
use Test::More;

BEGIN {
    use_ok('Neurolandia::Catalyst::CLI::Migration');
}

my $m = new_ok('Neurolandia::Catalyst::CLI::Migration');

ok( $m->set_migrate(1) );
is( $m->migrate, 1 );

my $db_exists = 1 if -f $m->sqlite_db_path;
SKIP: {
    skip
        'sqlite database exists. Please remove it to run this test for complete re-migration',
        2
        if $db_exists;

    is( $m->migrate_db, 1 );
    is( $m->populate_db, 1);
}

SKIP: {
    my $schema_file        = './lib/' . $m->schema_name . '.pm';
    my $schema_file_exists = 1 if -f $schema_file;
    skip 'schema file already exists', 1 if $schema_file_exists;

    # skip calling $m->call_model_creator_helper because
    # $m->migrate_schema_and_model already calling for it.
    is( $m->migrate_schema_and_model, 1 );
}

done_testing;
