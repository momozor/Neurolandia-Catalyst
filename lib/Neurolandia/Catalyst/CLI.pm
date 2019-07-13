package Neurolandia::Catalyst::CLI;
use MooseX::Modern;
use IPC::Cmd qw(can_run run);

with 'MooseX::Getopt';

=encoding utf8

=head1 NAME

Neurolandia::Catalyst::CLI - A role for command-line operations.

=head1 DESCRIPTION

An abstract class to be inherited with any command-line classes.

It uses MooseX::Getopt role to enable typical command-line functionalities. Please see the
documentation of MooseX::Getopt for further informations.

=head1 ATTRIBUTES/PROPERTIES

=head2 use_carton

A boolean attribute. If enabled, run external perl scripts, etc with carton.

=head2 verbose

Please see the documentation of 'verbose' attribute in MooseX::Getopt.

=cut

has 'use_carton' => ( is => 'rw', isa => 'Bool', default => 0 );
has 'verbose'    => ( is => 'rw', isa => 'Bool', default => 0 );

=head1 METHODS

=head2 auto_execute $cli

Automatically run external shell command with either 'carton exec $cli'
or not. Depends on the $self->use_carton state. 

=head3 $cli - An external command string

=cut

sub auto_execute {
    my ( $self, $cli ) = @_;

    my $is_carton_ok = $self->use_carton;
    if ($is_carton_ok) {
        my $CARTON_OK = can_run('carton');
        my $result
            = scalar run( command => "$CARTON_OK exec $cli", verbose => 1 );

        return $result;
    }

    elsif ( !$is_carton_ok ) {
        my $result = scalar run( command => "$cli", verbose => 1 );

        return $result;
    }
}

=head1 AUTHOR

Momozor

=head1 LICENSE

=cut

__PACKAGE__->meta->make_immutable;

1;
