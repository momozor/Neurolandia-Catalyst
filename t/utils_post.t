use strict;
use warnings;
use Test::More;

BEGIN { use_ok('Neurolandia::Catalyst::Utils::Post') }

my $pu = new_ok('Neurolandia::Catalyst::Utils::Post');

# FIXME Find a way to encapsulate Catalyst context to be passed
# to the first parameter.
# Note: Inheritance doesn't work in Controller app path.
#isa_ok( $pu->get_model_object_by_id( 2, 1 ), 'NCModel' );

done_testing();
