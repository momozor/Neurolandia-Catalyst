use strict;
use warnings;
use Test::More;

BEGIN {
    use_ok( 'Test::WWW::Mechanize::Catalyst' => 'Neurolandia::Catalyst' );
    use_ok('Neurolandia::Catalyst::Controller::Post');
}

my $root = 'http://127.0.0.1:3000';
my $ua1  = Test::WWW::Mechanize::Catalyst->new;

$ua1->get_ok( $root . '/post' );
$ua1->title_is('Posts Lists | Neurolandia');
$ua1->get_ok( $root . '/post/create_form' );
$ua1->title_is('Creation Form | Neurolandia');
$ua1->get_ok( $root . '/post/show/1' );
$ua1->get_ok( $root . '/post/edit_form/1' );
$ua1->title_is('Edit Form | Neurolandia');

done_testing();
