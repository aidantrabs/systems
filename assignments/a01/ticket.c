/**
--------------------------------------
Author: Aidan Traboulay
ID: 200115590
Email: trab5590@mylaurier.ca
--------------------------------------
**/

#include <stdio.h>
#include <string.h>

#define MAX_SIZE 10

int main() {
    char time[MAX_SIZE];
    int age;

    printf("Enter the time:\t");
    scanf("%s", time);

    printf("Enter the age:\t");
    scanf("%d", &age);

    if (age < 4) {
        printf("free\n");
    }

    if (strcmp(time, "day") == 0 && age >= 4) {
        printf("$8\n");
    }

    if (strcmp(time, "night") == 0) {
        if (age >= 4 && age <= 16) {
            printf("$12\n");
        }
        
        if (age >= 17 && age <= 54) {
            printf("$15\n");
        }

        if (age >= 55) {
            printf("$13\n");
        }
    }

    return 0;
}