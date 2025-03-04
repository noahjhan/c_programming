#include <stdio.h>
#include <stdlib.h>

int main() {
  int *arr = malloc(15 * sizeof(int));
  printf("%zu\n", sizeof(arr));
  return 0;
}
