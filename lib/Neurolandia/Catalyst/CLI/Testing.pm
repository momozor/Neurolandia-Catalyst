package Neurolandia::Catalyst::CLI::Testing;
use MooseX::Modern;

with 'Neurolandia::Catalyst::CLI';

has 'test_path' => ( is => 'rw', isa => 'Str', default => './t' );

sub is_test_path_correct {
    my ($self) = @_;

    # TODO return custom exception message (Throwable or Catalyst::Exception?)
    # instead of super verbose TAP::Harness exception.
    return 1 if -e $self->test_path;
}

__PACKAGE__->meta->make_immutable;

1;
