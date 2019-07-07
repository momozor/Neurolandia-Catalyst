use strict;
use warnings;
use Test::More;

BEGIN {
    use_ok('MooseX::Getopt');
    use_ok('Neurolandia::Catalyst::CLI');
}

my $test_dir = './t';
my $cli      = Neurolandia::Catalyst::CLI->new( test_dir_path => $test_dir );

is( $cli->is_test_path_correct, 1 );

done_testing();
