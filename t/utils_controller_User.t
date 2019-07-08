use strict;
use warnings;
use Test::More tests => 3;

BEGIN {
    use_ok('Neurolandia::Catalyst::Utils::Controller::User');
}

my $pu = new_ok('Neurolandia::Catalyst::Utils::Controller::User');

is( $pu->is_email_valid('admin@email.com'), 'admin@email.com' );

done_testing;
