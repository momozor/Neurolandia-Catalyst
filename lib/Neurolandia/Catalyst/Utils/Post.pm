package Neurolandia::Catalyst::Utils::Post;
use Moose;
use namespace::autoclean;

has 'current_post_model' => (
    is      => 'ro',
    isa     => 'Str',
    default => 'NCModel::Post',
);

# not covered by test
# note: cannot instantiate context object in test code
sub get_model_object_by_id {
    my ( $self, $context, $id ) = @_;

    Catalyst::Exception->throw('ID is not of type integer!')
        if $id !~ /[0-9]+/;
    return $context->model( $self->current_post_model )
        ->find( { id => $id } );
}

__PACKAGE__->meta->make_immutable;

1;
