package Neurolandia::Catalyst::Utils::Controller::User;
use MooseX::Modern;
use Email::Valid;

sub is_email_valid {
    my ( $self, $email ) = @_;

    return Email::Valid->address($email);
}

__PACKAGE__->meta->make_immutable;

1;
