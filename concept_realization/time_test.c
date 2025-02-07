#include <limits.h>
#include <stdio.h>
int main()
{
  int curr = 100;
  for (int i = 0; i < INT_MAX; ++i) {
    curr += i / curr;
  }
  printf("current value: %d\n", curr);
  return 0;
}
