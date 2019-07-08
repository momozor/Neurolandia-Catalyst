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
        'sqlite database exists. Please remove it to run this test for re-migration',
        1
        if $db_exists;

    is( $m->migrate_db, 1 );
}

SKIP: {
    my $schema_file        = './lib/' . $m->schema_name . '.pm';
    my $schema_file_exists = 1 if -f $schema_file;
    skip 'schema file already exists', 2 if $schema_file_exists;

    is( $m->call_model_creator_helper, 1 );
    is( $m->migrate_schema_and_model,  1 );
}

ok( $m->set_migrate_and_populate(1) );
is( $m->migrate_and_populate, 1 );

done_testing;
