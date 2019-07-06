use strict;
use warnings;
use Test::More;

BEGIN { use_ok('Neurolandia::Catalyst::Utils::Post') }

my $pu = new_ok('Neurolandia::Catalyst::Utils::Post');

#isa_ok( $pu->get_model_object_by_id( 2, 1 ), 'NCModel' );

done_testing();
