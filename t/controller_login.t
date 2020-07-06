use strict;
use warnings;
use Test::More;

use Catalyst::Test 'Neurolandia::Catalyst';
use Neurolandia::Catalyst::Controller::Login;

ok( request('/login')->is_success );

done_testing();
