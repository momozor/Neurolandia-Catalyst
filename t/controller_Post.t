use strict;
use warnings;
use Test::More;


use Catalyst::Test 'Neurolandia::Catalyst';
use Neurolandia::Catalyst::Controller::Post;

ok( request('/post')->is_success, 'Request should succeed' );
done_testing();
