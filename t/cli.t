use strict;
use warnings;
use Test::More;

BEGIN {
    use_ok('MooseX::Getopt');
    use_ok('Neurolandia::Catalyst::CLI');
}

my $cli = Neurolandia::Catalyst::CLI->new( test_path => './t' );
my $cli2
    = Neurolandia::Catalyst::CLI->new( test_path => 'not_exist_test_dir' );

is( $cli->is_test_path_correct, 1 );

isnt( $cli2->is_test_path_correct, 1 );

# works fine without --use_carton
# but you'll need to include Carton as a dependency too.
# Using carton from carton eh?
# TODO skip this test if --use_carton is invoked
#is( $cli->carton_execute('perl -v'), 1 );

done_testing();
