/**
--------------------------------------
Author: Aidan Traboulay
ID: 200115590
Email: trab5590@mylaurier.ca
--------------------------------------
**/

#include <stdio.h>
#include <stdlib.h>

int main() {
    FILE *file;
    char inputFile[BUFSIZ/4];
    char outputFile[BUFSIZ/4];
    char command[BUFSIZ]; 
    char *regex = "grep -E '^[a-zA-Z0-9]+([._+-]?[a-zA-Z0-9]+)*@[a-zA-Z0-9]+([.-]?[a-zA-Z0-9]+)*\\.[a-zA-Z]{2,}$' %s > %s";
    int execute_command;

    printf("Enter the name of the input file: ");
    scanf("%s", inputFile);

    file = fopen(inputFile, "r");
    if (file == NULL) {
        printf("Error opening input file: No such file or directory\n");
        return 1;
    }

    printf("Enter the name of the output file for valid emails: ");
    scanf("%s", outputFile);

    sprintf(command, regex, inputFile, outputFile);

    execute_command = system(command);
    
    if (execute_command != -1) {
        printf("Valid emails extracted and saved to %s\n", outputFile);
    } else {
        printf("Error executing grep command");
    }

    return 0;
}
