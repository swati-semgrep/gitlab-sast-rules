#include <stdio.h>
#include <string.h>

int main() {
  char str1[20] = "Finding flaw";
  char str2[20];

  // should report this
  strcpy(str2, str1);

  puts(str2); 

  return 0;
}