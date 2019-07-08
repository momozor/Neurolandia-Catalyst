package Neurolandia::Catalyst::CLI;
use MooseX::Modern;

with 'MooseX::Getopt';

=encoding utf8

=head1 NAME

Neurolandia::Catalyst::CLI - An abstract class for command-line operations.

=head1 DESCRIPTION

An abstract class (will be turned into a proper abstract class which cannot be instanced)
to be used with any command-line class classes.

It uses MooseX::Getopt to enable typical command-line functionalities. Please see the
documentation for the module.

=head1 ATTRIBUTES/PROPERTIES

=head2 use_carton

A boolean attribute. If enabled, run external perl scripts, etc with carton.

=head2 verbose

Please see the documentation of 'verbose' in MooseX::Getopt.

=cut

has 'use_carton' => ( is => 'rw', isa => 'Bool', default => 0 );
has 'verbose'    => ( is => 'rw', isa => 'Bool', default => 0 );

=head1 METHODS

=head2 carton_execute $cli

Run external command with carton.

=head3 $cli - An external command string

=cut

sub carton_execute {
    my ( $self, $cli ) = @_;
    my $EXIT_STATUS_OK = 0;

    return 1 if system( 'carton', 'exec', $cli ) == $EXIT_STATUS_OK;
}

=head1 AUTHOR

Momozor

=head1 LICENSE

=cut

__PACKAGE__->meta->make_immutable;

1;
