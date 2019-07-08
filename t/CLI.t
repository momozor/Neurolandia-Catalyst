use strict;
use warnings;
use Test::More;

BEGIN {
    use_ok('MooseX::Getopt');
    use_ok('Neurolandia::Catalyst::CLI');
}

my $cli = new_ok('Neurolandia::Catalyst::CLI');

is( $cli->carton_execute('perl -v'), 1 );

done_testing;
