// License: MIT (c) GitLab Inc.

#include <stdio.h>
#include <stdlib.h>

int main( void ){
    char username[L_cuserid];

    if( cuserid( username ) == NULL ) {
       fprintf( stderr, "login name not found" );
       exit(1);
    }
    printf( "%s\n", username );
    return( EXIT_SUCCESS );
}