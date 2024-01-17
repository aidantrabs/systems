/*
 *
 * ctest.c
 *
 * @author Aidan Traboulay
 *
 * @created 2024-01-17
 *
 */
#include <stdio.h>

int main(void) {
  char letter;
  
  for (letter = 'A'; letter <= 'z'; ++letter){
    fprintf(stdout, "%c\n", letter);
  }
  
  return 0;
}
