#include <dispatch/dispatch.h>
#include <stdio.h>
#include <stdlib.h>
#include <pthread.h>
#include <unistd.h>

#define BUFFER_CAP 16

pthread_t tid1, tid2;
int please_stop = 0;

int buffer[BUFFER_CAP];
int in = 0;
int out = 0;

dispatch_semaphore_t items, space;
pthread_mutex_t duck_in, duck_out;

void init() {
    items = dispatch_semaphore_create(0); // No items initially
    space = dispatch_semaphore_create(BUFFER_CAP); // Full space initially
    pthread_mutex_init(&duck_in, NULL);
    pthread_mutex_init(&duck_out, NULL);
}

pthread_mutex_t print_mutex = PTHREAD_MUTEX_INITIALIZER;

void print() {
    pthread_mutex_lock(&print_mutex); // Lock the print mutex to avoid race condition
    printf("[");
    for (int i = 0; i < BUFFER_CAP - 1; ++i) {
        printf("%d, ", buffer[i]);
    }
    printf("%d]\n", buffer[BUFFER_CAP - 1]);
    pthread_mutex_unlock(&print_mutex); // Unlock the mutex after printing
}

void sync_enqueue(int arg) {
    dispatch_semaphore_wait(space, DISPATCH_TIME_FOREVER); // Wait for space
    pthread_mutex_lock(&duck_in);

    buffer[in] = arg;
    in = (in + 1) % BUFFER_CAP;

    pthread_mutex_unlock(&duck_in);
    dispatch_semaphore_signal(items); // Signal that an item was added
}

int sync_dequeue() {
    dispatch_semaphore_wait(items, DISPATCH_TIME_FOREVER); // Wait for items
    pthread_mutex_lock(&duck_out);

    int result = buffer[out];
    buffer[out] = -1;
    out = (out + 1) % BUFFER_CAP;

    pthread_mutex_unlock(&duck_out);
    dispatch_semaphore_signal(space); // Signal that space is available

    return result;
}

void* insert_buffer(void* arg) {
    while (!please_stop) {
        sleep(2);
        int r = (rand() % 6) + 1;

        for (int i = 0; i < r; ++i) {
            sync_enqueue(rand() % 20);
            printf("inserting...\n");
            print();
        }
    }
    pthread_exit(NULL);
}

void* remove_buffer(void* arg) {
    while (!please_stop) {
        sleep(1);

        int r = (rand() % 4) + 1; // Random number of elements to remove
        for (int i = 0; i < r; ++i) {
            int item = sync_dequeue(); // Waits if no items are available
            printf("removing: %d\n", item);
            print();
        }
    }
    pthread_exit(NULL);
}

int main() {
    srand(time(NULL)); // Seed for random number generation
    init();

    pthread_create(&tid1, NULL, insert_buffer, NULL);
    pthread_create(&tid2, NULL, remove_buffer, NULL);

    sleep(10); // Run for 10 seconds
    please_stop = 1; // Stop threads

    pthread_join(tid1, NULL);
    pthread_join(tid2, NULL);

    pthread_mutex_destroy(&duck_in);
    pthread_mutex_destroy(&duck_out);
    dispatch_release(items);
    dispatch_release(space);

    printf("Program completed.\n");
    return 0;
}

