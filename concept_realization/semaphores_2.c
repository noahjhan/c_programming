#include <semaphore.h>
#include <pthread.h>
#include <stdio.h>
#include <stdlib.h>
#include <fcntl.h>
#include <errno.h>

int main(int argc, char** argv) {
    printf("We are counting some deprecated semaphores\n");

    sem_t *sem = sem_open("/semaphore", O_CREAT, 0644, 10);
    sem_post(sem);
    if (sem == SEM_FAILED) {
        perror("sem_open");
        exit(EXIT_FAILURE);
    } else {
        printf("Semaphore opened successfully!\n");
    }

    for (int i = 0; i < 10; ++i) {
        int code = sem_wait(&sem);
        if (code == 0) {
            printf("Success! Semaphore acquired.\n");
        } else {
            perror("sem_wait failed");
        }
    }

    if (sem_close(sem) == -1) {
        perror("sem_close failed");
    }

    if (sem_unlink("/semaphore") == -1) {
        perror("sem_unlink failed");
    }

    printf("Exiting...\n");
    return 0;
}

