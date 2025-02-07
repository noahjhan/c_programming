#include <stdio.h>
#include <unistd.h>
#include <signal.h>

int jiterator = 0;
void banana(int signal) { jiterator++; }

int i_should_quit = 0;

int main(int argc, char** argv) {
    signal(SIGSEGV, banana);

    while(1) {
        usleep(100000);

        if (argv[jiterator] == NULL) {
            i_should_quit++;
        }
        /*
        if (i_should_quit >= 3) {
            printf("%s\n", argv[i]);
            printf("quitting...\n");
            break;
        }
        */
        printf("%s\n", argv[jiterator]);
        jiterator++;
    }
    return 0;
}
