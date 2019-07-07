use strict;
use warnings;
use Test::More;

BEGIN {
    use_ok('Neurolandia::Catalyst::CLI::Testing');
}

my $cli = Neurolandia::Catalyst::CLI::Testing->new( test_path => './t' );
my $cli2
    = Neurolandia::Catalyst::CLI::Testing->new(
    test_path => 'not_exist_test_dir' );

is( $cli->is_test_path_correct, 1 );

isnt( $cli2->is_test_path_correct, 1 );

done_testing();
