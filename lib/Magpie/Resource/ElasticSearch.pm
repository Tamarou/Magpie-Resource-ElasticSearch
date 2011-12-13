package Magpie -Resource-ElasticSearch;
use Moose;
use namespace::autoclean;

# ABSTRACT: An Elastic Search Resource for Magpie

use Magpie::Constants;
use ElasticSearch;

extends 'Magpie::Resource';

has elastic_search => (
    isa     => 'ElasticSearch',
    is      => 'ro',
    lazy    => 1,
    builder => '_build_elastic_search'
);

sub _build_elastic_search {
    my $self = shift;
    return ElasticSearch->new( servers => $self->servers );
}

sub search {
    my ( $self, $index, $string ) = @_;
    my $es = $self->elastic_search;
    $es->search(
        index  => $index,
        queryb => $search_string,
    );
}

__PACKAGE__->meta->make_immutable;
1;
__END__
