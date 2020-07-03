use utf8;
package NCSchema::Result::Post;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

NCSchema::Result::Post

=cut

use strict;
use warnings;

use Moose;
use MooseX::NonMoose;
use MooseX::MarkAsMethods autoclean => 1;
extends 'DBIx::Class::Core';

=head1 COMPONENTS LOADED

=over 4

=item * L<DBIx::Class::InflateColumn::DateTime>

=back

=cut

__PACKAGE__->load_components("InflateColumn::DateTime");

=head1 TABLE: C<Post>

=cut

__PACKAGE__->table("Post");

=head1 ACCESSORS

=head2 author

  data_type: 'varchar'
  is_nullable: 0
  size: 255

=head2 title

  data_type: 'varchar'
  is_nullable: 0
  size: 255

=head2 content

  data_type: 'varchar'
  is_nullable: 0
  size: 255

=cut

__PACKAGE__->add_columns(
  "author",
  { data_type => "varchar", is_nullable => 0, size => 255 },
  "title",
  { data_type => "varchar", is_nullable => 0, size => 255 },
  "content",
  { data_type => "varchar", is_nullable => 0, size => 255 },
);


# Created by DBIx::Class::Schema::Loader v0.07049 @ 2020-07-04 06:30:17
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:mkcTpjTQzkBbhBCM9PVMqQ


# You can replace this text with custom code or comments, and it will be preserved on regeneration
__PACKAGE__->meta->make_immutable;
1;
