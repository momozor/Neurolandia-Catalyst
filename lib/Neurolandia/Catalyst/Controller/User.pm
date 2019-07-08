package Neurolandia::Catalyst::Controller::User;
use Moose;

BEGIN { extends 'Neurolandia::Catalyst::Controller'; }

# hide /user route from being accessed from anybody
# with :Private modifier
sub index : Path : Args(0) : Private {
    my ( $self, $c ) = @_;
}

sub login_form : Local {
    my ( $self, $c ) = @_;

    $c->stash( { template => 'user/login.html' } );
}

sub login : Local {
    my ( $self, $c ) = @_;

    my $email_address = $c->request->params->{email_address};
    my $password      = $c->request->params->{password};

    if ( $email_address && $password ) {

        if ( $c->authenticate( {
            email_address => $email_address,
            password      => $password
        } ) )
        {
            $c->stash( { template => 'user/login_done.html' } );
        }
    }
}

sub logout : Local {
    my ( $self, $c ) = @_;

    $c->logout;
    $c->response->redirect( $c->uri_for('/') );
}

__PACKAGE__->meta->make_immutable;

1;
