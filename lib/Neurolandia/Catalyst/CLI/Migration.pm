package Neurolandia::Catalyst::CLI::Migration;
use Moose;
use namespace::autoclean;

extends 'Neurolandia::Catalyst::CLI';

has 'migrate'  => ( 'is' => 'rw', 'isa' => 'Bool', default => 0 );
has 'rollback' => ( 'is' => 'rw', 'isa' => 'Bool', default => 0 );

__PACKAGE__->meta->make_immutable;

1;
