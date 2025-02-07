#include <stdio.h>

void ChopUpDigits(unsigned int number, unsigned int *digits, int base)
{
  int i = 0;
  if (base == 0) {
    while (number != 0) {
      digits[i] = number % 8;
      number = number / 8;
      i++;
    }
  } else {
    while (number != 0) {
      digits[i] = number % 16;
      number = number / 16;
      i++;
    }
  }
}

int main()
{
  unsigned int arr[32];
  unsigned int number = 49385;
  int base = 1;
  ChopUpDigits(number, arr, base);

  for (unsigned i = 0; i < 32; ++i) {
    printf("%u\n", arr[i]);
  }
}
