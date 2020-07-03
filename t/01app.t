#!/usr/bin/env perl
use strict;
use warnings;
use Test::More;

use Catalyst::Test 'Neurolandia::Catalyst';

ok( request('/')->is_success );

ok( request('/site')->is_success );
ok( request('/site/about')->is_success );

ok( request('/post')->is_success );
ok( request('/post/create_form')->is_success );
ok( request('/post/show/1')->is_success );
 
done_testing();
