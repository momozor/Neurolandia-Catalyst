use strict;
use warnings;
use Test::More;

BEGIN {
    use_ok('Neurolandia::Catalyst::CLI::Migration');
}

my $m = new_ok('Neurolandia::Catalyst::CLI::Migration');

ok( $m->set_migrate(1) );
is( $m->migrate, 1 );

SKIP: {
    my $db_exists = 1 if -f $m->sqlite_db_path;
    skip
        'sqlite database exists. Please remove it to run this test for re-migration',
        1
        if $db_exists;

    is( $m->migrate_db, 1 );
}

is( $m->migrate_schema_and_model, 1 );

done_testing;
