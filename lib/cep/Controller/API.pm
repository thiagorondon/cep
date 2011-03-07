
package cep::Controller::API;

use Moose;
use namespace::autoclean;

BEGIN { extends 'Catalyst::Controller' }

sub base : Chained('/base') : PathPart('api') : CaptureArgs(0) {
}

sub estados : Chained('base') PathPart('estados') Args(0) {
    my ( $self, $c ) = @_;
    my @data;

    map { push( @data, $_->estado ) }
      $c->model('DB::Localidade')->search( {}, { group_by => [qw/estado/] } )
      ->as_subselect_rs->search( {}, { columns => [qw/estado/] } )->all;

    $c->stash->{estados} = \@data;
    $c->forward('View::JSON');
}

sub cep : Chained('base') : PathPart('') : Args(1) {
    my ( $self, $c, $value ) = @_;

    $value =~ s/-//g;

    $c->stash->{cep} = undef and $c->forward('View::JSON') and $c->detach
      unless $value =~ /^[0-9]*$/;

    my $table_log = 'DB::Log' . &cep_estado($value);
    my $data = $c->model($table_log)->search( { cep => $value } )->first;

    $c->stash->{cep} = {
      bairro => $data->bairrorel->nome,
      cidade => $data->bairrorel->cidade->nome,
      uf => $data->bairrorel->cidade->estado,
      map { $_ => $data->$_ }
          qw/logradouro cep complemento tipo logradouro_s_acento/
      };
    $c->forward('View::JSON');
}

sub cep_estado {
    my $cep = shift;
    return 'ac' if ( $cep >= 69900000 && $cep <= 69999999 );
    return 'al' if ( $cep >= 57000000 && $cep <= 57999999 );
    return 'al' if ( $cep >= 57000000 && $cep <= 57999999 );
    return 'am' if ( $cep >= 69400000 && $cep <= 69899999 );
    return 'ap' if ( $cep >= 68900000 && $cep <= 68999999 );
    return 'ba' if ( $cep >= 40000000 && $cep <= 48999999 );
    return 'ce' if ( $cep >= 60000000 && $cep <= 63999999 );
    return 'df'
      if ( $cep >= 70000000 && $cep <= 72799999 )
      || ( $cep >= 73000000 && $cep <= 73699999 );
    return 'es' if ( $cep >= 29000000 && $cep <= 29999999 );
    return 'go'
      if ( $cep >= 72800000 && $cep <= 72999999 )
      || ( $cep >= 73700000 && $cep <= 76799999 );
    return 'ma' if ( $cep >= 65000000 && $cep <= 65999999 );
    return 'mg' if ( $cep >= 30000000 && $cep <= 39999999 );
    return 'ms' if ( $cep >= 79000000 && $cep <= 79999999 );
    return 'mt' if ( $cep >= 78000000 && $cep <= 78899999 );
    return 'pa' if ( $cep >= 66000000 && $cep <= 68899999 );
    return 'pb' if ( $cep >= 58000000 && $cep <= 58999999 );
    return 'pe' if ( $cep >= 50000000 && $cep <= 56999999 );
    return 'pi' if ( $cep >= 64000000 && $cep <= 64999999 );
    return 'pr' if ( $cep >= 80000000 && $cep <= 87999999 );
    return 'rj' if ( $cep >= 20000000 && $cep <= 28999999 );
    return 'rn' if ( $cep >= 59000000 && $cep <= 59999999 );
    return 'ro' if ( $cep >= 78900000 && $cep <= 78999999 );
    return 'rr' if ( $cep >= 69300000 && $cep <= 69399999 );
    return 'rs' if ( $cep >= 90000000 && $cep <= 99999999 );
    return 'sc' if ( $cep >= 88000000 && $cep <= 89999999 );
    return 'se' if ( $cep >= 49000000 && $cep <= 49999999 );
    return 'sp' if ( $cep >= 01000000 && $cep <= 19999999 );
    return 'to' if ( $cep >= 77000000 && $cep <= 77999999 );
    return undef;
}

__PACKAGE__->meta->make_immutable;

1;

