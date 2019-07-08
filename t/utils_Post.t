use strict;
use warnings;
use Test::More tests => 6;

BEGIN { use_ok('Neurolandia::Catalyst::Utils::Post') }

my $pu = new_ok('Neurolandia::Catalyst::Utils::Post');

is( $pu->is_type_integer(823823),   1 );
is( $pu->is_type_integer(23_33_22), 1 );
is( $pu->is_type_integer(0),        1 );
isnt( $pu->is_type_integer('w'), 1 );

done_testing();
