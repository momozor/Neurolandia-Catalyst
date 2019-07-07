use strict;
use warnings;
use Test::More;

BEGIN {
    use_ok('MooseX::Getopt');
    use_ok('Neurolandia::Catalyst::CLI');
}

my $cli = Neurolandia::Catalyst::CLI->new;

# works fine without --use_carton
# but you'll need to include Carton as a dependency too.
# Using carton from carton eh?
# TODO skip this test if --use_carton is invoked
#is( $cli->carton_execute('perl -v'), 1 );

done_testing();
