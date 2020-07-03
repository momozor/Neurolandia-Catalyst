use strict;
use warnings;
use Test::More;


use Catalyst::Test 'Neurolandia::Catalyst';
use Neurolandia::Catalyst::Controller::Site;

ok( request('/site')->is_success );
ok( request('/site/about')->is_success );

done_testing();
