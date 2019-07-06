use strict;
use warnings;
use Test::More;

use Catalyst::Test 'Neurolandia::Catalyst';

BEGIN { use_ok('Neurolandia::Catalyst::Controller::Root') }

ok( request('/')->is_success );
ok( request('/about')->is_success );

done_testing();
