/**
--------------------------------------
Author: Aidan Traboulay
ID: 200115590
Email: trab5590@mylaurier.ca
--------------------------------------
**/

#include <stdio.h>
#include <ctype.h>
#include <stdbool.h>

#define MAX_SIZE 15

int main() {
    int n, x[MAX_SIZE][MAX_SIZE] = {0};

    printf("Please enter a value for the Pascal triangle\n");
    scanf("%d", &n); 
  
    if (n < 0 || n >= 15) {
        printf("Invalid input. Please enter a positive Integer less than 15.\n");
        return 1;
    }

    for (int i = 0; i < n; i++) {
        x[i][0] = 1;
        x[i][i] = 1;
    }

    for (int i = 2; i < n; i++) {
        for (int j = 1; j < i; j++) {
            x[i][j] = x[i-1][j-1] + x[i-1][j];
        }
    }

    for (int i = 0; i < n; i++) {
        for (int j = 0; j <= i; j++) {
            printf("%-4d ", x[i][j]);
        }

        printf("\n");

    }

    return 0;
}