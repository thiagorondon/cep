
package cep::View::TT;

use Moose;
BEGIN { extends 'Catalyst::View::TT' }

__PACKAGE__->config(
    INCLUDE_PATH => [
        cep->path_to( 'root', 'src' ),
        cep->path_to( 'root', 'lib' )
    ],
    TEMPLATE_EXTENSION => '.tt',
    ENCODING => 'utf-8',
    WRAPPER => 'site/wrapper.tt',
    TIMER => 0
);

1;

