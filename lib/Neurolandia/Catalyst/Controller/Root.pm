package Neurolandia::Catalyst::Controller::Root;
use MooseX::Modern;

BEGIN { extends 'Catalyst::Controller' }

#
# Sets the actions in this controller to be registered with no prefix
# so they function identically to actions created in MyApp.pm
#
__PACKAGE__->config( namespace => '' );

sub auto : Private {
    my ( $self, $c ) = @_;

    # Allow unauthenticated users to reach the login page.  This
    # allows unauthenticated users to reach any action in the Login
    # controller.  To lock it down to a single action, we could use:
    #   if ($c->action eq $c->controller('User')->action_for('index'))
    # to only allow unauthenticated access to the 'index' action we
    # added above.
    if (   ( $c->controller eq $c->controller('User') )
        || ( $c->action eq $c->controller('Root')->action_for('index') )
        || ( $c->action eq $c->controller('Post')->action_for('show') )
        || ( $c->controller eq $c->controller('Root') ) )
    {
        return 1;
    }

    # If a user doesn't exist, force login
    if ( !$c->user_exists ) {

        # Dump a log message to the development server debug output
        $c->log->debug(
            '***Root::auto User not found, forwarding to /user/login');

        # Redirect the user to the login page
        $c->response->redirect( $c->uri_for(
            $c->controller('User')->action_for('login_form') ) );

    # Return 0 to cancel 'post-auto' processing and prevent use of application
        return 0;
    }

    # User found, so return 1 to continue with processing after this 'auto'
    return 1;
}

sub index : Path : Args(0) {
    my ( $self, $c ) = @_;

    $c->stash( {
        template => 'home.html',
        posts    => [ $c->model('NCModel::Post')->all ],
    } );
}

sub about : Local {
    my ( $self, $c ) = @_;

    $c->stash( { template => 'about.html' } );
}

sub default : Path {
    my ( $self, $c ) = @_;

    $c->response->status(404);
    $c->stash( { template => 'error/404.html' } );
}

sub end : ActionClass('RenderView') { }

__PACKAGE__->meta->make_immutable;

1;
