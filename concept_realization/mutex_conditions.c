#include <pthread.h>
#include <stdio.h>
#include <time.h>
#include <unistd.h>
#include <stdlib.h>

// concept is we have an integer to represent state
// state cannot be negative -> we can't subtract from an empty state
// state cannot exceed capacity -> we can't add to a full state

pthread_mutex_t duck = PTHREAD_MUTEX_INITIALIZER;
pthread_cond_t cond = PTHREAD_COND_INITIALIZER;

int please_stop = 0;

int curr = 5;
const int capacity = 10;

void *threadrunner_add(void *arg)
{
    pthread_mutex_lock(&duck);
    while (curr == capacity)
    {
        pthread_cond_wait(&cond, &duck);
	printf("full -> waiting...\n");
    }
    curr += 1;
    printf("adding... curr is %d\n", curr);
    pthread_cond_signal(&cond);

    pthread_mutex_unlock(&duck);
    return NULL;
}

void *threadrunner_subtract(void *arg)
{
    pthread_mutex_lock(&duck);

    while (curr == 0)
    {
        pthread_cond_wait(&cond, &duck);
	printf("empty -> waiting...\n");
    }
    curr -= 1;
    printf("subtracting... curr is %d\n", curr);
    pthread_cond_signal(&cond);
    pthread_mutex_unlock(&duck);
    return NULL;
}

void *producer(void *arg)
{
    while (!please_stop)
    {
	sleep(2);
        int r = (rand() % 6) + 1;

        for (int i = 0; i < r; ++i)
        {
            threadrunner_add(NULL);
        }
    }
    pthread_exit(NULL);
}
void *consumer(void *arg)
{
    while (!please_stop)
    {
        sleep(1);
        int r = (rand() % 3) + 1;

        for (int i = 0; i < r; ++i)
        {
            threadrunner_subtract(NULL);
        }
    }
    pthread_exit(NULL);
}

void time_to_stop(int signal)
{
    printf("\nstopping process...\n");
    please_stop = 1;
}

int main()
{
    srand(time(NULL));
    signal(SIGINT, time_to_stop);
    pthread_t tid_1;
    pthread_t tid_2;
    pthread_create(&tid_1, NULL, producer, NULL);
    pthread_create(&tid_1, NULL, consumer, NULL);
    pthread_join(tid_1, NULL);
    pthread_join(tid_1, NULL);
    printf("process complete\n");
    exit(0);
}
