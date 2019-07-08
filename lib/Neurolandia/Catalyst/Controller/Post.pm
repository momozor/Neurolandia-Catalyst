package Neurolandia::Catalyst::Controller::Post;
use MooseX::Modern;
use Neurolandia::Catalyst::Utils::Controller::Post;

BEGIN { extends 'Catalyst::Controller' }

has 'post_util' => (
    is      => 'ro',
    isa     => 'Neurolandia::Catalyst::Utils::Controller::Post',
    default => sub {
        my ($self) = @_;

        return Neurolandia::Catalyst::Utils::Controller::Post->new;
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

sub create_form : Chained('/') : PathPart('post/create/form') : Args(0) {
    my ( $self, $c ) = @_;

    $c->stash( { template => 'post/create_form.html' } );
}

sub create : Local {
    my ( $self, $c ) = @_;

    my $title   = $c->request->params->{title};
    my $content = $c->request->params->{content};
    my $user_id = $c->user->get('id');

    if ( $title && $content && $user_id ) {
        my $post = $c->model( $self->post_util->current_post_model )->create(
            {
                title   => $title,
                content => $content,
                user_id => $user_id
            }
        );
        $c->stash( { template => 'post/create_done.html', post => $post } );
    }
}

sub edit_form : Chained('/') : PathPart('post/edit/form') : Args(1) {
    my ( $self, $c, $id ) = @_;

    # save post id into session to be used by edit action
    $c->session->{current_post_id} = $id;
    my $post = $self->post_util->get_model_object_by_id( $c, $id );

    $c->stash( { template => 'post/edit_form.html', post => $post } );
}

sub edit : Local {
    my ( $self, $c ) = @_;

    my $id      = $c->session->{current_post_id};
    my $title   = $c->request->params->{title};
    my $content = $c->request->params->{content};

    if ( $id && $title && $content ) {

        my $post = $self->post_util->get_model_object_by_id( $c, $id );
        $post->title($title);
        $post->content($content);
        $post->update;

        $c->stash( { template => 'post/edit_done.html', post => $post } );
    }
}

sub delete : Chained('/') : PathPart('post/delete') : Args(1) {
    my ( $self, $c, $id ) = @_;

    if ($id) {
        $self->post_util->get_model_object_by_id( $c, $id )->delete;

        $c->stash( { template => 'post/delete_done.html' } );
    }
}

__PACKAGE__->meta->make_immutable;

1;
