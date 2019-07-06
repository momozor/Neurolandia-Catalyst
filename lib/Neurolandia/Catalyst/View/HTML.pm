package Neurolandia::Catalyst::View::HTML;
use Moose;
use namespace::autoclean;

extends 'Catalyst::View::TT';

__PACKAGE__->config(
    TEMPLATE_EXTENSION => '.tt',
    render_die         => 1,
    WRAPPER            => 'default_layout.tt',
);

=head1 NAME

Neurolandia::Catalyst::View::HTML - TT View for Neurolandia::Catalyst

=head1 DESCRIPTION

TT View for Neurolandia::Catalyst.

=head1 SEE ALSO

L<Neurolandia::Catalyst>

=head1 AUTHOR

momozor,,,

=head1 LICENSE

This library is free software. You can redistribute it and/or modify
it under the same terms as Perl itself.

=cut

1;
