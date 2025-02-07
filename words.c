#include <stdio.h>
#include <unistd.h>

// this code segfaults
// tries to access data outside of memory 
// prints some neat stuff that we should not be able to see
int main(int argc, char** argv) {
    int i = 0;
    // printf("%s/n", argv[47]);
    char** fuck;
    printf("number of arguments: %d\n", argc);
    while(1) {
        if (1 || argv[i] != NULL) {
            printf("%s\n", fuck[i]);
            usleep(10000);
        }
        i++;
        if (i == 20000) {
            printf("enough already\n");
            break;
        }
        printf("i: %d\n", i);
    }
    return 0;
}
