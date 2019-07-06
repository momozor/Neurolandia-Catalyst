package Neurolandia::Catalyst::Utils::Post;
use Moose;
use namespace::autoclean;

has 'current_post_model' => (
    is      => 'ro',
    isa     => 'Str',
    default => 'NCModel::Post',
);

sub get_model_object_by_id {
    my ( $self, $c, $id ) = @_;

    return $c->model( $self->current_post_model )->find( { id => $id } );
}

__PACKAGE__->meta->make_immutable;

1;
