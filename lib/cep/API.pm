
package llcb::API;

use Moose;
use MongoDB;
use Text::CSV;

# TODO:
# - Validar UF
# - Validar Latitude, Longitude.

has host => (
    is      => 'ro',
    isa     => 'Str',
    default => '127.0.0.1'
);

has database => (
    is      => 'ro',
    isa     => 'Str',
    default => 'llcb'
);

has collection => (
    is      => 'ro',
    isa     => 'Str',
    default => 'llcb'
);

has db_conn => (
    is      => 'ro',
    isa     => 'Object',
    lazy    => 1,
    default => sub { MongoDB::Connection->new( host => shift->host ) }
);

has db_database => (
    is      => 'ro',
    isa     => 'Object',
    lazy    => 1,
    default => sub {
        my $self = shift;
        $self->db_conn->get_database( $self->database );
    }
);

has db_collection => (
    is      => 'ro',
    isa     => 'Object',
    lazy    => 1,
    default => sub {
        my $self = shift;
        $self->db_database->get_collection( $self->collection );
    }
);

has uf => (
    is        => 'ro',
    isa       => 'Str',
    predicate => 'has_uf'
);

has cidade => (
    is        => 'ro',
    isa       => 'Str',
    predicate => 'has_cidade'
);

has csv => (
    is        => 'ro',
    isa       => 'Str',
    predicate => 'has_csv'
);

has csv_fh => (
    is      => 'ro',
    isa     => 'FileHandle',
    lazy    => 1,
    default => sub { open my $fh, '<:utf8', shift->csv; $fh }
);

has csv_handle => (
    is      => 'ro',
    isa     => 'Object',
    lazy    => 1,
    default => sub { Text::CSV->new }
);

sub update {
    my $self = shift;
    die 'you need to set csv' unless $self->has_csv;
    die 'I cant read the csv' unless -r $self->csv;
    my $collection = $self->db_collection;
    $collection->drop;

    while ( my $row = $self->csv_handle->getline( $self->csv_fh ) ) {
        $collection->insert(
            {
                uf        => $row->[0],
                cidade    => $row->[1],
                latitude  => $row->[2],
                longitude => $row->[3]
            },
            { save => 1 }
        );
    }

    return $collection;
}

sub buscar {
    my $self       = shift;
    my $collection = $self->db_collection;
    die 'you need to set uf' unless $self->has_uf;

    my $cursor = $collection->query( { uf => $self->uf } );

    return $cursor;
}

1;

