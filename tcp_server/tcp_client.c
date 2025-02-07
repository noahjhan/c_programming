#include <netdb.h>
#include <netinet/in.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <sys/socket.h>
#include <sys/types.h>
#include <unistd.h>

int main(int argc, char **argv)
{
  struct addrinfo hints, *result;

  char *PORT_NUM;

  if (argc == 2) {
    PORT_NUM = argv[1];
  } else {
    PORT_NUM = "8683"; // this is my default port numbah
  }

  memset(&hints, 0, sizeof(struct addrinfo));

  hints.ai_family = AF_INET;       // IPv4 (AF_INET6 for IPv6 addresses)
  hints.ai_socktype = SOCK_STREAM; // TPC like a POSIX pipes
                                   //
  int s = getaddrinfo("127.0.0.1", PORT_NUM, &hints, &result);
  if (s != 0) {
    fprintf(stderr, "getaddrinfo: %s\n", gai_strerror(s));
    exit(1);
  }
  int sock_fd = socket(result->ai_family, result->ai_socktype,
                       result->ai_protocol /*will be zero */);
  if (sock_fd == -1) {
    perror("socket failed");
    exit(1);
  }

  int connect_result = connect(sock_fd, result->ai_addr, result->ai_addrlen);
  if (connect_result == -1) {
    perror("conect failed");
    exit(1);
  }
  puts("connected!");

  // #define MESG "GET / HTTP/1.0\r\nHOST: illinois.edu\r\n\r\n"

  // write(sock_fd, MESG, strlen(MESG));

  char buffer[1024];

  while (1) {
    ssize_t bytes_recd = read(sock_fd, buffer, sizeof(buffer));
    if (bytes_recd > 0) {
      write(1, buffer, bytes_recd);
    } else {
      break; // 0 = end, -1 = failure
    }
  }
  return 0;
}
