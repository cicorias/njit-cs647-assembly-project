SOURCES=hello.S
OBJECTS=hello.o
PRODUCT=hello

$(PRODUCT) : $(OBJECTS)
	ld -s -o hello $(OBJECTS)

$(OBJECTS) : $(SOURCES)
	as -o hello.o $(SOURCES)

clean:
	rm hello hello.o
