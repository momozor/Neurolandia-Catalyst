use strict;
use warnings;
use Test::More;

BEGIN {
    use_ok('Neurolandia::Catalyst::CLI::Migration');
}

my $m = new_ok('Neurolandia::Catalyst::CLI::Migration');

ok( $m->set_migrate(1) );
is( $m->migrate, 1 );

is( $m->migrate_db, 1 );

done_testing();
