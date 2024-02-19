/**
--------------------------------------
Author: Aidan Traboulay
ID: 200115590
Email: trab5590@mylaurier.ca
--------------------------------------
**/

#include <stdio.h>
#include <stdlib.h>

void file_handler(char *input_file, char *output_file);
int handle_input(const char *input_file);
void exec_command(const char *input_file, const char *output_file);

void file_handler(char *input_file, char *output_file) {
    printf("Enter the name of the input file: ");
    scanf("%s", input_file);

    printf("Enter the name of the output file for valid emails: ");
    scanf("%s", output_file);

    return;
}

int handle_input(const char *input_file) {
    FILE *file = fopen(input_file, "r");
    
    if (file == NULL) {
        fprintf(stderr, "Error opening input file: No such file or directory\n");
        return 0;
    }
    
    fclose(file);

    return 1;
}

void exec_command(const char *input_file, const char *output_file) {
    char command[BUFSIZ];
    char *regex = "grep -E '^[a-zA-Z0-9]+([._+-]?[a-zA-Z0-9]+)*@[a-zA-Z0-9]+([.-]?[a-zA-Z0-9]+)*\\.[a-zA-Z]{2,}$' %s > %s";
    
    sprintf(command, regex, input_file, output_file);
    
    int execute_command = system(command);

    if (execute_command != -1) {
        printf("Valid emails extracted and saved to %s\n", output_file);
    } else {
        fprintf(stderr, "Error executing grep command");
    }

    return;
}

int main() {
    char input_file[BUFSIZ / 4];
    char output_file[BUFSIZ / 4];

    file_handler(input_file, output_file);

    if (handle_input(input_file)) {
        exec_command(input_file, output_file);
    }

    return 0;
}
