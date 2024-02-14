/**
--------------------------------------
Author: Aidan Traboulay
ID: 200115590
Email: trab5590@mylaurier.ca
--------------------------------------
**/

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <sys/types.h>
#include <sys/wait.h>
#include <unistd.h>

int shell();

int main() {
    shell();
    return 0;
}

int shell() {    
    int running = 1;
    char input[BUFSIZ];
    char *command;
    char *args[BUFSIZ / 2];
    int i;

    while (running) {
        i = 0;
        fflush(stdout);
        printf("myshell> ");
        
        if (fgets(input, BUFSIZ, stdin) == NULL) {
            printf("Error: Can't read input\n");
            return 1;
        }

        if (strcmp(input, "\n") == 0) {
            continue;
        }

        command = strtok(input, " \n");

        if (strcmp(command, "q") == 0) {
            running = 0;
            continue;
        }

        while (command != NULL) {
            args[i] = command;
            command = strtok(NULL, " \n");
            i++;
        }

        args[i] = NULL;

        if (fork() == 0) {
            execvp(args[0], args);
            printf("Error: Command doesn't exist or run\n");
            return 1;
        }

        wait(NULL);
    }

    return 0;
}