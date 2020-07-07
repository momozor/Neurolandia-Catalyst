use strict;
use warnings;
use Test::More tests => 6;

BEGIN {
    use_ok( 'Test::WWW::Mechanize::Catalyst' => 'Neurolandia::Catalyst' );
    use_ok('Neurolandia::Catalyst::Controller::Root');
}

my $root = 'http://127.0.0.1:3000';
my $ua1  = Test::WWW::Mechanize::Catalyst->new;

$ua1->get_ok( $root . '/' );
$ua1->title_is('Home | Neurolandia');
$ua1->get_ok( $root . '/about' );
$ua1->title_is('About | Neurolandia');

done_testing();
