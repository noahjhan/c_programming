#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <pthread.h>
#include <string.h>

void* threadrunner_a(void*arg) {
    printf("Hello, Thread!\n");
    return(NULL);
}

int main(int argc, char** argv) {
  printf("Hello, World!\n");
  char* str_1  = "terminator\0do_i_exist??";
  char* str_2 = "terminator";
  int len_1 = strlen(str_1);
  int len_2 = strlen(str_2);

  char* str_3 = malloc(sizeof(char) * 20);
  str_3[19] = '\0';
  for (int i = 0; i < 20; ++i) {
  str_3[i] = 'a';  
  }
  printf("length of str_3: %d\n", strlen(str_3));
  printf("len of w/ null: %d\n", len_1);
  printf("len of non-null: %d\n", len_2);
  printf("size of null: %u\n", sizeof(str_1));
  printf("size of non-null: %u\n", sizeof(str_2));
  exit(0);
}

