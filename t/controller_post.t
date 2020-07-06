use strict;
use warnings;
use Test::More tests => 6;

BEGIN {
    use_ok( 'Test::WWW::Mechanize::Catalyst' => 'Neurolandia::Catalyst' );
    use_ok('Neurolandia::Catalyst::Controller::Post');
}

my $root = 'http://127.0.0.1:3000';
my $ua1  = Test::WWW::Mechanize::Catalyst->new;

$ua1->get_ok( $root . '/post' );
$ua1->get_ok( $root . '/post/create_form' );
$ua1->get_ok( $root . '/post/show/1' );
$ua1->get_ok( $root . '/post/edit_form/1' );

done_testing();
