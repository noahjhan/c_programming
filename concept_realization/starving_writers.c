// motivation: a generic reader-writer priortizes readers
// writers have to wait for n readers to finish
// we need to introduce state variables
#include <pthread.h>
#include <signal.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>

typedef struct {
  char name[25];
  int age;
} Person;

int writers = 0;
int writing = 0;

int readers = 0;
int reading = 0;
int please_stop = 0;

int num_reads = 0;
int num_writes = 0;

Person person;

pthread_t tid_1;
pthread_t tid_2;

pthread_mutex_t duck = PTHREAD_MUTEX_INITIALIZER;
pthread_cond_t cv_reader;
pthread_cond_t cv_writer;

void signal_handler(int sig)
{
  printf("\nsafely exiting program...\n");
  please_stop = 1;
}

void threadrunner_read()
{
  printf("name: %s\n", person.name);
  printf("age: %d\n", person.age);
  num_reads++;
}

void threadrunner_write()
{
  printf("adjusting age...\n");
  person.age += 1;
  num_writes++;
}

void *threadrunner_generate_read(void *arg)
{
  while (!please_stop) {
    pthread_mutex_lock(&duck);
    readers++;
    while (writing) {
      pthread_cond_wait(&cv_reader, &duck);
    }
    reading++;
    threadrunner_read();
    readers--;
    reading--;
    if (writers <= readers) {
      pthread_cond_signal(&cv_writer);
    } else {
      pthread_cond_broadcast(&cv_reader);
    }
    pthread_mutex_unlock(&duck);
  }
  return NULL;
}

void *threadrunner_generate_write(void *arg)
{
  while (!please_stop) {
    pthread_mutex_lock(&duck);
    writers++;
    while (writing || reading) {
      pthread_cond_wait(&cv_writer, &duck);
    }
    writing++;
    threadrunner_write();
    writers--;
    writing--;
    if (writers <= readers) {
      pthread_cond_signal(&cv_writer);
    } else {
      pthread_cond_broadcast(&cv_reader);
    }
    pthread_mutex_unlock(&duck);
  }
  return NULL;
}

Person person;

int main(int argc, char **argv)
{
  signal(SIGINT, signal_handler);
  person.age = 0;
  strcpy(person.name, "Peter Griffin");

  pthread_create(&tid_1, NULL, threadrunner_generate_read, NULL);
  pthread_create(&tid_2, NULL, threadrunner_generate_write, NULL);

  pthread_join(tid_1, NULL);
  pthread_join(tid_2, NULL);

  printf("num reads: %d\n", num_reads);
  printf("num writes: %d\n", num_writes);

  return 0;
}

