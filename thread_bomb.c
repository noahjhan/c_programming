#include <pthread.h>
#include <stdlib.h>
#include <unistd.h>
#include <stdio.h>

void* foo(void* arg) {
    usleep(1000);
    printf("fudge\n");
    pthread_exit(NULL);
}

int main() {
    pthread_t duck[1024];
    int i = 0;

    while (i < 1024) {
        if (pthread_create(&duck[i], NULL, foo, NULL) != 0) {
            perror("pthread_create");
            exit(EXIT_FAILURE);
        }
        i++;
    }

    for (i = 0; i < 1024; i++) {
        if (pthread_join(duck[i], NULL) != 0) {
            perror("pthread_join");
            exit(EXIT_FAILURE);
        }
    }

    return 0;
}

