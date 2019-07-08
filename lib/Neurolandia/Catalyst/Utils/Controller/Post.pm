package Neurolandia::Catalyst::Utils::Controller::Post;
use Moose;
use namespace::autoclean;

has 'current_post_model' => (
    is      => 'ro',
    isa     => 'Str',
    default => 'NCModel::Post',
);

# DoC
# not covered by test
# note: cannot instantiate context object in test code
sub get_model_object_by_id {
    my ( $self, $c, $id ) = @_;

    Catalyst::Exception->throw('ID is not of type integer!')
        if !$self->is_type_integer($id);
    return $c->model( $self->current_post_model )->find( { id => $id } );
}

sub is_type_integer {
    my ( $self, $data ) = @_;

    return 1 if $data =~ /[0-9]+/;
}

__PACKAGE__->meta->make_immutable;

1;
