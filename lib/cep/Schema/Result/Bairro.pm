package cep::Schema::Result::Bairro;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

use strict;
use warnings;

use base 'DBIx::Class::Core';


=head1 NAME

cep::Schema::Result::Bairro

=cut

__PACKAGE__->table("bairros");

=head1 ACCESSORS

=head2 codigo

  data_type: 'integer'
  is_nullable: 1

=head2 localidade

  data_type: 'integer'
  is_nullable: 1

=head2 nome

  data_type: 'varchar'
  is_nullable: 1
  size: 72

=cut

__PACKAGE__->add_columns(
  "codigo",
  { data_type => "integer", is_nullable => 1 },
  "localidade",
  { data_type => "integer", is_nullable => 1 },
  "nome",
  { data_type => "varchar", is_nullable => 1, size => 72 },
);


# Created by DBIx::Class::Schema::Loader v0.07010 @ 2011-03-07 14:05:01
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:tdX0aevea+O3GSrtsdykvA


# You can replace this text with custom code or comments, and it will be preserved on regeneration

__PACKAGE__->has_one( cidade => 'cep::Schema::Result::Localidade' =>
        { 'foreign.codigo' => 'self.localidade' } );


1;
