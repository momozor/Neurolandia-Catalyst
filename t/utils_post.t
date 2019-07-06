use strict;
use warnings;
use Test::More tests => 2;

BEGIN { use_ok('Neurolandia::Catalyst::Utils::Post') }

my $pu = new_ok('Neurolandia::Catalyst::Utils::Post');

done_testing();
