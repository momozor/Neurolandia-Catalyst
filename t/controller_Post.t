use strict;
use warnings;
use Test::More;


use Catalyst::Test 'Neurolandia::Catalyst';
use Neurolandia::Catalyst::Controller::Post;

ok( request('/post')->is_success );
ok( request('/post/create_form')->is_success );
ok( request('/post/show/1')->is_success );
ok( request('/post/edit_form/1')->is_success );

done_testing();
