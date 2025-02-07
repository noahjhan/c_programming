#include <stdio.h>
#include <stdlib.h>

int main(int argc, char **argv)
{
  FILE *file;
  file = fopen("test_text.txt", "r");
  char buffer[50];

  if (file == NULL) {
    perror("the file could not open\n");
    exit(0);
  }

  printf("file opened!\n");

  fread(&buffer, sizeof(char), sizeof(buffer) - 1, file);

  printf("buffer contents: %s", buffer);
}
