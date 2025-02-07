#include <stdio.h>
#include <string.h>

int main()
{
    char name[25];
    int age;

    printf("What is your name? ");
    fgets(name, 25, stdin);

    name[strcspn(name, "\n")] = '\0';

    // Print name
    printf("Your name is: %s\n", name);

    // Prompt for age
    printf("Hello, World!\nHow old are you? ");

    // Use scanf to read age
    scanf("%d", &age);

    // Print age
    printf("You are %d years old.\n", age);

    return 0;
}
