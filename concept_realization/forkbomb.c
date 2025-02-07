#include <unistd.h>
#include <stdlib.h>
#include <stdio.h>
#include <string.h>
#include <sys/stat.h>
#include <time.h>

#define STRING_LENGTH 10

int directory_exists(const char *path)
{
    struct stat statbuf;
    return (stat(path, &statbuf) == 0 && S_ISDIR(statbuf.st_mode));
}

void generateRandomString(char *str, int length)
{
    const char charset[] = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";
    int charsetSize = sizeof(charset) - 1;

    for (int i = 0; i < length; i++)
    {
        int randomIndex = rand() % charsetSize;
        str[i] = charset[randomIndex];
    }
    str[length] = '\0';
}

int main()
{
    mkdir("/Users/noahhan/cpp projects/c_programming/folder of folders", 0777);
    const char *base_path = "/Users/noahhan/cpp projects/c_programming/folder of folders/";
    srand(time(NULL));
    int count = 81;
    while (count--)
    {
        ;
        char folder_name[STRING_LENGTH + 1];
        generateRandomString(folder_name, STRING_LENGTH);

        size_t dir_name_size = strlen(base_path) + strlen(folder_name) + 2;
        char dir_name[dir_name_size];

        snprintf(dir_name, dir_name_size, "%s/%s", base_path, folder_name);

        if (!directory_exists(dir_name))
        {
            int num = 81 - count;
            mkdir(dir_name, 0777);
            printf("making directory %d...\nfolder name -> %s\n\n", num, folder_name);
        }
    }

    return 0;
}
