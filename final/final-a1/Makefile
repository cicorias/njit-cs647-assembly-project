SOURCES=add.S
OBJECTS=add.o
PRODUCT=add

all: $(PRODUCT)

$(PRODUCT) : $(OBJECTS)
	ld -o $(PRODUCT) $(OBJECTS)
# ld -m elf_i386 -o $(PRODUCT) $(OBJECTS)

$(OBJECTS) : $(SOURCES)
	as -g -o $(OBJECTS) $(SOURCES)

clean:
	rm -f $(PRODUCT) $(OBJECTS) main
