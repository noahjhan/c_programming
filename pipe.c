#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>

#define BUF_SIZE 32

char *msg_1 = "Hello, World!";
char *msg_2 = "Welcome to CS 341!";
char *msg_3 = "Interprocess Communication (IPC)";

int main(int argc, char **argv)
{
  char inbuf[BUF_SIZE];
  int p[2];

  if (pipe(p) < 0) {
    perror("pipe failed to open, exiting...\n");
    exit(1);
  }

  pid_t pid = fork();

  if (pid == 0) { /* child process */
    close(p[0]);

    char msg_4[BUF_SIZE];
    printf("Enter your name: ");
    fgets(msg_4, BUF_SIZE, stdin);

    write(p[1], msg_1, BUF_SIZE);
    write(p[1], msg_2, BUF_SIZE);
    write(p[1], msg_3, BUF_SIZE);
    write(p[1], msg_4, BUF_SIZE);

    close(p[1]);
  } else if (pid > 0) { /* parent process */
    close(p[1]);

    for (unsigned i = 0; i < 4; ++i) {
      read(p[0], inbuf, BUF_SIZE);
      printf("%s\n", inbuf);
    }

    close(p[0]);
  } else {
    perror("fork failed, exiting...\n");
    exit(1);
  }
  exit(0);
}
