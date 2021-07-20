// License: MIT (c) GitLab Inc.
#include <stdio.h>
#include <stdlib.h>
 
int main(){
 
    FILE* demo;
    demo = fopen("demo_file.txt", "w");

    fprintf(demo, "%s", "Humans are welcome");
    fclose(demo);
 
    return 0;
}