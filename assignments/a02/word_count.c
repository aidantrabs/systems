/**

--------------------------------------

Author: Aidan Traboulay

ID: 200115590

Email: trab5590@mylaurier.ca

--------------------------------------

**/


#include <stdio.h>

#include <string.h>


void file_handler(char *filename);


int main() {

    int is_running = 1;

    char choices[2] = {'f', 'q'};

    char choice;

    char filename[BUFSIZ];


    printf("This program counts the number of lines and words of a file\n");


    while (is_running) {

        printf("Enter f for entering file name, q to quit: ");

        scanf(" %c", &choice); 


        if (choice == choices[1]) {

            is_running = 0;

        } else if (choice == choices[0]) {

            printf("Enter file name: ");

            scanf("%s", filename);

            file_handler(filename);

        } else {

            printf("Invalid choice\n");

        }

    }

   

    printf("Good bye\n");


    return 0;

}


void file_handler(char *filename) {

    char line[BUFSIZ];

    int words = 0;

    int lines = 0;

    double avg = 0.0;


    FILE *file = fopen(filename, "r");

    if (file == NULL || file == 0) {

        printf("%s cannot be opened\n\n", filename);

        return;

    }

    

    printf("Content of %s:\n\n", filename); 

    while (fgets(line, BUFSIZ, file)) {

        printf("%s", line); 

        

        if (line[strlen(line) - 1] != '\n') {

            printf("\n"); 

        }


        lines++;


        for (int i = 0; line[i] != '\0'; i++) {

            if (line[i] == ' ' || line[i] == '\n' || line[i] == '\t') {

                if (i > 0 && (line[i-1] != ' ' && line[i-1] != '\n' && line[i-1] != '\t')) {

                    words++;

                }

            } else if (line[i+1] == '\0') { 

                words++;

            }

        }

    }


    avg = (double) words / lines;


    printf("\nNumber of lines of %s: %d\n", filename, lines);

    printf("Number of words of %s: %d\n", filename, words);

    printf("Average number of words per line of %s: %.2f\n", filename, avg);

    

    fclose(file);

}
