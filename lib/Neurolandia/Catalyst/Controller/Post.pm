package Neurolandia::Catalyst::Controller::Post;
use Moose;
use namespace::autoclean;

BEGIN { extends 'Catalyst::Controller'; }

=head1 NAME

Neurolandia::Catalyst::Controller::Post - Catalyst Controller

=head1 DESCRIPTION

Catalyst Controller.

=head1 METHODS

=cut


=head2 index

=cut

sub index :Path :Args(0) {
    my ( $self, $c ) = @_;
    
    $c->stash( {template => 'post/list.tt', posts => [$c->model('NCModel::Post')->all]} );
}

sub create :Local {
    my ( $self, $c) = @_;
    
    $c->stash( {template => 'post/create_form.tt'} );
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
