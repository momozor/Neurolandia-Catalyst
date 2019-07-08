package Neurolandia::Catalyst::Controller::User;
use MooseX::Modern;
use Neurolandia::Catalyst::Utils::Controller::User;

BEGIN { extends 'Catalyst::Controller'; }

has 'user_util' => (
    is      => 'ro',
    isa     => 'Neurolandia::Catalyst::Utils::Controller::User',
    default => sub {
        my ($self) = @_;

        return Neurolandia::Catalyst::Utils::Controller::User->new;
    },
);

# hide /user route from being accessed from anybody
# with :Private modifier
sub index : Path : Args(0) : Private {
    my ( $self, $c ) = @_;
}

sub login_form : Local {
    my ( $self, $c ) = @_;

    $c->stash( { template => 'user/login_form.html' } );
}

sub login : Local {
    my ( $self, $c ) = @_;

    my $em            = $c->request->params->{email_address};
    my $email_address = $self->user_util->is_email_valid($em);
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
    $c->response->redirect( $c->uri_for(
        $c->controller('Root')->action_for('index') ) );
}

__PACKAGE__->meta->make_immutable;

1;
