CC = gcc
CFLAGS = -Wall -Werror -g -std=gnu99
TARGET = word_count shell

all: $(TARGET)

word_count: word_count.c
	$(CC) $(CFLAGS) -o word_count word_count.c

ticket: shell.c
	$(CC) $(CFLAGS) -o shell shell.c

clean:
	rm -f $(TARGET) *.o *~ *.bak
	rm -rf *.dSYM

runwordcount:
	./word_count

runshell:
	./shell