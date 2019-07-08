package Neurolandia::Catalyst::CLI;
use Moose;
use namespace::autoclean;

with 'MooseX::Getopt';

has 'use_carton' => ( is => 'rw', isa => 'Bool', default => 0 );
has 'verbose'    => ( is => 'rw', isa => 'Bool', default => 0 );

sub carton_execute {
    my ( $self, $cli ) = @_;
    my $EXIT_STATUS_OK = 0;

    return 1 if system( 'carton', 'exec', $cli ) == $EXIT_STATUS_OK;
}

__PACKAGE__->meta->make_immutable;

1;
