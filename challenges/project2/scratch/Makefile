SOURCES=vulncpy.c
OBJECTS=vulncpy.o
PRODUCT=vulncpy

uname_m := $(shell uname -m)
$(info uname_m=$(uname_m))
# 32 bit
LDFLAGS.i686=
ASFLAGS.i686=
# 64 bit~
LDFLAGS.x86_64=-m elf_i386
ASFLAGS.x86_64=-32

# set for run
LDFLAGS += $(LDFLAGS.$(uname_m))
ASFLAGS += $(ASFLAGS.$(uname_m))


all: $(PRODUCT)

$(PRODUCT) : $(SOURCES)
# ld -o $(PRODUCT) $(OBJECTS)
	gcc -m32 -g -z execstack -fno-stack-protector -o $(PRODUCT) $(SOURCES)

clean:
	rm -f $(PRODUCT) $(OBJECTS)
