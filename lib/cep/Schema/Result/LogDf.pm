package cep::Schema::Result::LogDf;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

use strict;
use warnings;

use base 'DBIx::Class::Core';


=head1 NAME

cep::Schema::Result::LogDf

=cut

__PACKAGE__->table("log_df");

=head1 ACCESSORS

=head2 localidade

  data_type: 'integer'
  is_nullable: 1

=head2 logradouro

  data_type: 'char'
  is_nullable: 1
  size: 70

=head2 bairro

  data_type: 'integer'
  is_nullable: 1

=head2 cep

  data_type: 'char'
  is_nullable: 1
  size: 8

=head2 complemento

  data_type: 'char'
  is_nullable: 1
  size: 100

=head2 tipo

  data_type: 'char'
  is_nullable: 1
  size: 30

=head2 logradouro_s_acento

  data_type: 'char'
  is_nullable: 1
  size: 70

=cut

__PACKAGE__->add_columns(
  "localidade",
  { data_type => "integer", is_nullable => 1 },
  "logradouro",
  { data_type => "char", is_nullable => 1, size => 70 },
  "bairro",
  { data_type => "integer", is_nullable => 1 },
  "cep",
  { data_type => "char", is_nullable => 1, size => 8 },
  "complemento",
  { data_type => "char", is_nullable => 1, size => 100 },
  "tipo",
  { data_type => "char", is_nullable => 1, size => 30 },
  "logradouro_s_acento",
  { data_type => "char", is_nullable => 1, size => 70 },
);


# Created by DBIx::Class::Schema::Loader v0.07010 @ 2011-03-07 14:05:01
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:QzSU3QcdNikBgX+QqLrBbw


# You can replace this text with custom code or comments, and it will be preserved on regeneration
__PACKAGE__->has_one( bairrorel => 'cep::Schema::Result::Bairro' =>
        { 'foreign.codigo' => 'self.bairro' } );
1;
