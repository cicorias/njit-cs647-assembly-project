SOURCES1=getEnvAddr.c
OBJECTS1=getEnvAddr.o
PRODUCT1=getEnvAddr

SOURCES2=getSystem.c
OBJECTS2=getSystem.o
PRODUCT2=getSystem

uname_m := $(shell uname -m)
$(info uname_m=$(uname_m))
# 32 bit
GCCFLAGS.i686=
# 64 bit~
GCCFLAGS.x86_64=-m32

# set for run
GCCFLAGS+=$(GCCFLAGS.$(uname_m))

all: $(PRODUCT1) $(PRODUCT2)

$(PRODUCT1) : $(SOURCES1)
	gcc $(GCCFLAGS) -o $(PRODUCT1) $(SOURCES1) -ldl


$(PRODUCT2) : $(SOURCES2)
	gcc $(GCCFLAGS) -o $(PRODUCT2) $(SOURCES2) -ldl

clean:
	rm -f $(PRODUCT1) $(OBJECTS1)
	rm -f $(PRODUCT2) $(OBJECTS2)
