package Neurolandia::Catalyst::Model::NCModel;

use strict;
use base 'Catalyst::Model::DBIC::Schema';

__PACKAGE__->config(
    schema_class => 'NCSchema',
    
    connect_info => {
        dsn => 'dbi:SQLite:./var/database.db',
        user => '',
        password => '',
        on_connect_do => q{PRAGMA foreign_keys = ON},
    }
);

=head1 NAME

Neurolandia::Catalyst::Model::NCModel - Catalyst DBIC Schema Model

=head1 SYNOPSIS

See L<Neurolandia::Catalyst>

=head1 DESCRIPTION

L<Catalyst::Model::DBIC::Schema> Model using schema L<NCSchema>

=head1 GENERATED BY

Catalyst::Helper::Model::DBIC::Schema - 0.65

=head1 AUTHOR

momozor

=head1 LICENSE

This library is free software, you can redistribute it and/or modify
it under the same terms as Perl itself.

=cut

1;
