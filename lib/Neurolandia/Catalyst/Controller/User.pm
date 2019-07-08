package Neurolandia::Catalyst::Controller::User;
use Moose;

BEGIN { extends 'Neurolandia::Catalyst::Controller'; }

# hide /user route from being accessed from anybody
# with :Private modifier
sub index : Path : Args(0) : Private {
    my ( $self, $c ) = @_;
}

sub login : Local {
    my ( $self, $c ) = @_;

    $c->stash( { template => 'user/login.html' } );
}

__PACKAGE__->meta->make_immutable;

1;
