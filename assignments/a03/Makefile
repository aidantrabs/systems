CC = gcc
CFLAGS = -Wall -Werror -g -std=gnu99
TARGET = regex

all: $(TARGET)

regex: regex.c
	$(CC) $(CFLAGS) -o regex regex.c

clean:
	rm -f $(TARGET) *.o *~ *.bak
	rm -rf *.dSYM

runregex:
	./regex