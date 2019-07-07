package Neurolandia::Catalyst::CLI;
use Moose;
use namespace::autoclean;

with 'MooseX::Getopt';

my $test_dir = './t';
has 'test_dir_path' => ( is => 'rw', isa => 'Str', default => $test_dir );
has 'verbose'       => ( is => 'rw', isa => 'Bool' );

sub is_test_path_correct {
    my ($self) = @_;

    # TODO return custom exception message (Throwable or Catalyst::Exception?)
    # instead of super verbose TAP::Harness exception.
    return 1 if -d $self->test_dir_path;
}

__PACKAGE__->meta->make_immutable;

1;
