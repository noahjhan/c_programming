#include <arpa/inet.h>
#include <netinet/in.h>
#include <signal.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <sys/socket.h>
#include <sys/types.h>
#include <unistd.h>

#define BUFFER_SIZE 1024

void serve_file(int client_fd, const char *file_path, const char *content_type);
void handle_client_request(int client_fd);
void signal_handler(int signal);
void start_server(int port_num);

void serve_file(int client_fd, const char *file_path, const char *content_type)
{
  printf("formatted request: %s\n", file_path);
  FILE *file = fopen(file_path, "rb");
  if (!file) {
    perror("Failed to open file");
    close(client_fd);
    return;
  }

  char http_header[BUFFER_SIZE];
  snprintf(http_header, sizeof(http_header),
           "HTTP/1.1 200 OK\r\n"
           "Content-Type: %s\r\n"
           "Connection: close\r\n"
           "\r\n",
           content_type);
  send(client_fd, http_header, strlen(http_header), 0);

  char buffer[BUFFER_SIZE];
  size_t bytes_read;
  while ((bytes_read = fread(buffer, 1, sizeof(buffer), file)) > 0) {
    send(client_fd, buffer, bytes_read, 0);
  }

  fclose(file);
}

void handle_client_request(int client_fd)
{
  char request[BUFFER_SIZE];
  ssize_t len = read(client_fd, request, sizeof(request) - 1);
  if (len <= 0) {
    perror("Failed to read client request");
    close(client_fd);
    return;
  }

  request[len] = '\0';
  printf("Client Request:\n%s\n", request);

  char *start_ptr = strstr(request, "GET /");
  char *end_ptr = strstr(request, " HTTP/");

  if (start_ptr && end_ptr) {
    start_ptr += 5; // Skip "GET /"
    size_t path_length = end_ptr - start_ptr;
    char resource_path[path_length + 1];
    strncpy(resource_path, start_ptr, path_length);
    resource_path[path_length] = '\0';

    if (strlen(resource_path) == 0 ||
        strcmp(resource_path, "index.html") == 0) {
      serve_file(client_fd, "basic_page.txt", "text/html; charset=UTF-8");
    } else if (strstr(resource_path, "IMG")) {
      serve_file(client_fd, resource_path, "image/png");
    } else if (strstr(resource_path, ".pdf")) {
      serve_file(client_fd, resource_path, "application/pdf");
    } else {
      const char *error_response = "HTTP/1.1 404 Not Found\r\n"
                                   "Content-Type: text/plain; charset=UTF-8\r\n"
                                   "Connection: close\r\n"
                                   "\r\n"
                                   "404 Not Found\n";
      send(client_fd, error_response, strlen(error_response), 0);
    }
  } else {
    const char *error_response = "HTTP/1.1 400 Bad Request\r\n"
                                 "Content-Type: text/plain; charset=UTF-8\r\n"
                                 "Connection: close\r\n"
                                 "\r\n"
                                 "400 Bad Request\n";
    send(client_fd, error_response, strlen(error_response), 0);
  }

  close(client_fd);
}

void signal_handler(int signal)
{
  printf("Signal %d received, exiting gracefully...\n", signal);
  exit(0);
}

void start_server(int port_num)
{

  int sock_fd = socket(AF_INET, SOCK_STREAM, 0);
  if (sock_fd < 0) {
    perror("Socket creation failed");
    exit(1);
  }

  struct sockaddr_in server_addr;
  memset(&server_addr, 0, sizeof(server_addr));
  server_addr.sin_family = AF_INET;
  server_addr.sin_addr.s_addr = INADDR_ANY;
  server_addr.sin_port = htons(port_num);

  if (bind(sock_fd, (struct sockaddr *)&server_addr, sizeof(server_addr)) < 0) {
    perror("Binding failed");
    close(sock_fd);
    exit(1);
  }

  if (listen(sock_fd, 10) < 0) {
    perror("Listening failed");
    close(sock_fd);
    exit(1);
  }

  printf("Server is listening on port %d...\n", port_num);

  while (1) {
    int client_fd = accept(sock_fd, NULL, NULL);
    if (client_fd < 0) {
      perror("Accept failed");
      continue;
    }

    printf("Connection made: client_fd=%d\n", client_fd);
    handle_client_request(client_fd);
  }

  close(sock_fd);
}

int main(int argc, char **argv)
{
  signal(SIGINT, signal_handler);

  int port_num = 8063;
  if (argc == 2) {
    port_num = atoi(argv[1]);
  }

  start_server(port_num);
  return 0;
}

