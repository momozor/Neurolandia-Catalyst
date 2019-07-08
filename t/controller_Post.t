use strict;
use warnings;
use Test::More;

BEGIN {
    use_ok( 'Test::WWW::Mechanize::Catalyst' => 'Neurolandia::Catalyst' );
    use_ok('Neurolandia::Catalyst::Controller::Post');
}

my $root = 'http://localhost:3000';
my $ua1  = Test::WWW::Mechanize::Catalyst->new;

$ua1->get_ok( $root . '/post' );
$ua1->title_is('Posts Lists | Neurolandia');
$ua1->content_contains('SICP');
$ua1->content_contains('The Greenpeace');

$ua1->get_ok( $root . '/user/login' );
$ua1->title_is('Login | Neurolandia');
$ua1->submit_form(
    fields => {
        email_address => 'admin@email.com',
        password      => 'whatever5'
    }
);
$ua1->title_is('Login Successful | Neurolandia');

$ua1->get_ok( $root . '/post/create/form' );
$ua1->title_is('Creation Form | Neurolandia');
$ua1->submit_form(
    fields => {
        title   => 'The Battleship',
        content => 'Why it survives?',
    }
);
$ua1->title_is('Creation Successful | Neurolandia');
$ua1->get_ok( $root . '/post' );
$ua1->content_contains('The Battleship');
$ua1->content_contains('Why it survives?');

$ua1->get_ok( $root . '/post/delete/3' );
$ua1->title_is('Deletion Successful | Neurolandia');
$ua1->get_ok( $root . '/post' );
$ua1->content_lacks('The Battleship');
$ua1->content_lacks('Why it survives?');

$ua1->get_ok( $root . '/post/show/1' );
$ua1->title_is('SICP | Neurolandia');

$ua1->get_ok( $root . '/post/edit/form/2' );
$ua1->title_is('Edit Form | Neurolandia');
$ua1->submit_form(
    fields => {
        title   => 'The Greenpeace-edited',
        content => 'Why Climate Change is now a Climate CRISIS?-edited',
    }
);
$ua1->title_is('Edit Successful | Neurolandia');

$ua1->get_ok( $root . '/post' );
$ua1->content_contains('The Greenpeace-edited');
$ua1->content_contains('Why Climate Change is now a Climate CRISIS?-edited');
$ua1->get_ok( $root . '/post/edit/form/2' );
$ua1->submit_form(
    fields => {
        title   => 'The Greenpeace',
        content => 'Why Climate Change is now a Climate CRISIS?',
    }
);
$ua1->title_is('Edit Successful | Neurolandia');

$ua1->get_ok( $root . '/post' );
$ua1->content_contains('The Greenpeace');
$ua1->content_contains('Why Climate Change is now a Climate CRISIS?');

done_testing;
