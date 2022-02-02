TARGET = caeser
LIBS = -lm
CC = gcc
CFLAGS = -O0
OLDCFLAGS = -g -Wall -O0

.PHONY: default all clean

default: $(TARGET)
all: default

OBJECTS = $(patsubst %.c, %.o, $(wildcard *.c))
HEADERS = $(wildcard *.h)

%.o: %.c $(HEADERS)
	$(CC) $(CFLAGS) -c $< -o $@
	$(CC) -S $< -O2 -o caeser.s
	as -o caeser2.o caeser.s
	ld -s -o altprog -dynamic-linker  /lib64/ld-linux-x86-64.so.2 /usr/lib/x86_64-linux-gnu/crt1.o /usr/lib/x86_64-linux-gnu/crti.o  -lc caeser2.o /usr/lib/x86_64-linux-gnu/crtn.o


.PRECIOUS: $(TARGET) $(OBJECTS)

$(TARGET): $(OBJECTS)
	$(CC) $(OBJECTS) -Wall $(LIBS) -o $@
	objdump -S -w -Matt --disassemble $(TARGET) > foobar.s

clean:
	-rm -f *.o *.s altprog
	-rm -f $(TARGET)