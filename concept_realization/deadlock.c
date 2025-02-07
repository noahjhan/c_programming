#include <pthread.h>
#include <stdio.h>

pthread_mutex_t duck = PTHREAD_MUTEX_INITIALIZER;

void *counter(void *arg)
{
    int *counter = (int *)arg;
    for (int i = 0; i < 1000000; i++)
    {
        pthread_mutex_lock(&duck);
        (*counter)++;
        pthread_mutex_unlock(&duck);
    }
    return NULL;
}

int main()
{
    int count = 0;
    pthread_t tid1;
    pthread_t tid2;
    pthread_create(&tid1, NULL, counter, &count);
    pthread_create(&tid2, NULL, counter, &count);
    pthread_join(tid1, NULL);
    pthread_join(tid2, NULL);
    printf("%d\n", count);
}
