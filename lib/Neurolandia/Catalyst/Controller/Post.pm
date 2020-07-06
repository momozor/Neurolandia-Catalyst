package Neurolandia::Catalyst::Controller::Post;
use Moose;
use Neurolandia::Catalyst::Utils::Post;

BEGIN { extends 'Neurolandia::Catalyst::Controller' }

has 'post_util' => (
    is      => 'ro',
    isa     => 'Neurolandia::Catalyst::Utils::Post',
    default => sub {
        my ($self) = @_;

        return Neurolandia::Catalyst::Utils::Post->new;
    },
);

sub index : Path : Args(0) {
    my ( $self, $c ) = @_;

    $c->stash( {
        template => 'post/list.html',
        posts    => [ $c->model( $self->post_util->current_post_model )->all ]
    } );
}

sub show : Chained('/') : PathPart('post/show') : Args(1) {
    my ( $self, $c, $id ) = @_;

    my $post = $self->post_util->get_model_object_by_id( $c, $id );

    $c->stash( { template => 'post/show.html', post => $post } );
}

sub create_form : Local {
    my ( $self, $c ) = @_;

    $c->stash( { template => 'post/create_form.html' } );
}

sub create : Local {
    my ( $self, $c ) = @_;

    my $title   = $c->request->params->{title};
    my $content = $c->request->params->{content};

    my $post = $c->model( $self->post_util->current_post_model )->create( {
        title   => $title,
        content => $content,
    } );

    $c->stash( { template => 'post/create_done.html', post => $post } );
}

sub edit_form : Chained('/') : PathPart('post/edit_form') : Args(1) {
    my ( $self, $c, $id ) = @_;

    my $post = $self->post_util->get_model_object_by_id( $c, $id );

    $c->stash( { template => 'post/edit_form.html', post => $post } );
}

sub edit : Local {
    my ( $self, $c ) = @_;

    my $id      = $c->request->params->{id};
    my $title   = $c->request->params->{title};
    my $content = $c->request->params->{content};

    my $post = $self->post_util->get_model_object_by_id( $c, $id );
    $post->title($title);
    $post->content($content);
    $post->update;

    $c->stash( { template => 'post/edit_done.html', post => $post } );
}

sub delete : Chained('/') : PathPart('post/delete') : Args(1) {
    my ( $self, $c, $id ) = @_;

    $self->post_util->get_model_object_by_id( $c, $id )->delete;

    $c->stash( { template => 'post/delete_done.html' } );
}

__PACKAGE__->meta->make_immutable;

1;
