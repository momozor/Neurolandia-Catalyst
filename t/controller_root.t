use strict;
use warnings;
use Test::More tests => 6;

BEGIN {
    use_ok( 'Test::WWW::Mechanize::Catalyst' => 'Neurolandia::Catalyst' );
    use_ok('Neurolandia::Catalyst::Controller::Root');
}

my $root = 'http://127.0.0.1:3000';
my $ua   = Test::WWW::Mechanize::Catalyst->new;

$ua->get_ok( $root . '/' );
$ua->title_is('Home | Neurolandia');

$ua->get_ok( $root . '/about' );
$ua->title_is('About | Neurolandia');

done_testing();
