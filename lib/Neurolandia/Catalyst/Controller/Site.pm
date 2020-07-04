package Neurolandia::Catalyst::Controller::Site;
use Moose;
use namespace::autoclean;

BEGIN { extends 'Catalyst::Controller'; }

=head1 NAME

Neurolandia::Catalyst::Controller::Site - Catalyst Controller

=head1 DESCRIPTION

Catalyst Controller.

=head1 METHODS

=cut


=head2 index

=cut

sub index :Path :Args(0) {
    my ( $self, $c ) = @_;

    $c->response->body('Matched Neurolandia::Catalyst::Controller::Site in Site.');
}

sub test :Local {
    my ( $self, $c ) = @_;
    $c->stash({template => 'site/test.tt', username => 'Momo'});
}

=encoding utf8

=head1 AUTHOR

momozor,,,

=head1 LICENSE

This library is free software. You can redistribute it and/or modify
it under the same terms as Perl itself.

=cut

__PACKAGE__->meta->make_immutable;

1;
