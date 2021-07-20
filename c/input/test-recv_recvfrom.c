// License: MIT (c) GitLab Inc.
#include<stdio.h>
#include<stdlib.h>

struct student{
    char name[50];
    char stream[50];
    int rollno;
} std;

int main()
{
    FILE *fp;
    fp = fopen("students.txt", "rb");

    printf("Testing fread() function: \n\n");

    while( fread(&std, sizeof(std), 1, fp) == 1 )
    {
        printf("Name: %s \n", std.name);
        printf("stream: %s \n", std.stream);
        printf("rollno: %d \n", std.rollno);
    }

    fclose(fp);
    return 0;
}