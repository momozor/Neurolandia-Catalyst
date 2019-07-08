package Neurolandia::Catalyst::Utils::Controller::User;
use Moose;
use Email::Valid;
use namespace::autoclean;

sub is_email_valid {
    my ( $self, $email ) = @_;

    return Email::Valid->address($email);
}

__PACKAGE__->meta->make_immutable;

1;
