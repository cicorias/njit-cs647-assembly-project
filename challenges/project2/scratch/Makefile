SOURCES=vulncpy.c
OBJECTS=vulncpy.o
PRODUCT=vulncpy

uname_m := $(shell uname -m)
$(info uname_m=$(uname_m))
# 32 bit
GCCFLAGS.i686=
# 64 bit~
GCCFLAGS.x86_64=-m32

# set for run
# GCCFLAGS+=-g -z execstack -fno-stack-protector $(GCCFLAGS.$(uname_m))
GCCFLAGS+=-g $(GCCFLAGS.$(uname_m))

all: $(PRODUCT)

$(PRODUCT) : $(SOURCES)
	gcc $(GCCFLAGS) -o $(PRODUCT) $(SOURCES) -ldl

clean:
	rm -f $(PRODUCT) $(OBJECTS)
