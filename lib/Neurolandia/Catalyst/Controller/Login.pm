package Neurolandia::Catalyst::Controller::Login;
use Moose;

BEGIN { extends 'Neurolandia::Catalyst::Controller'; }

# login form
sub index : Path : Args(0) {
    my ( $self, $c ) = @_;

    $c->stash( { template => 'login/sign_in.html' } );
}

__PACKAGE__->meta->make_immutable;

1;
