package cep::Schema::Result::Localidade;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

use strict;
use warnings;

use base 'DBIx::Class::Core';


=head1 NAME

cep::Schema::Result::Localidade

=cut

__PACKAGE__->table("localidades");

=head1 ACCESSORS

=head2 codigo

  data_type: 'integer'
  is_nullable: 1

=head2 nome

  data_type: 'varchar'
  is_nullable: 1
  size: 50

=head2 estado

  data_type: 'char'
  is_nullable: 1
  size: 2

=cut

__PACKAGE__->add_columns(
  "codigo",
  { data_type => "integer", is_nullable => 1 },
  "nome",
  { data_type => "varchar", is_nullable => 1, size => 50 },
  "estado",
  { data_type => "char", is_nullable => 1, size => 2 },
);


# Created by DBIx::Class::Schema::Loader v0.07010 @ 2011-03-07 14:05:01
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:beJWUDaXSu5AMv+OorXjxQ


# You can replace this text with custom code or comments, and it will be preserved on regeneration
1;
