package Neurolandia::Catalyst::CLI;
use Moose;
use namespace::autoclean;

with 'MooseX::Getopt';

my $test_path = './t';
has 'test_path'  => ( is => 'rw', isa => 'Str',  default => $test_path );
has 'use_carton' => ( is => 'rw', isa => 'Bool', default => 0 );
has 'verbose'    => ( is => 'rw', isa => 'Bool', default => 0 );

sub is_test_path_correct {
    my ($self) = @_;

    # TODO return custom exception message (Throwable or Catalyst::Exception?)
    # instead of super verbose TAP::Harness exception.
    # Also, move this and relatives into the subclass of CLI::Testing class.
    return 1 if -e $self->test_path;
}

sub carton_execute {
    my ( $self, $cli ) = @_;
    my $cli_exit_status_ok = 0;
    return 1 if system( 'carton', 'exec', $cli ) == $cli_exit_status_ok;
}

__PACKAGE__->meta->make_immutable;

1;
