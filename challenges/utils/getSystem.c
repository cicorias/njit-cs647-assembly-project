#include <stdio.h>
#include <dlfcn.h>

// compile with: (x64)  gcc -o getSystem getSystem.c -ldl
// compile with: (i386) gcc -m32 -o getSystem getSystem.c -ldl
// -ldl -- link to libdl.so

int main(int argc, char *argv[]) {
    void *h, *p;
    h = dlopen(NULL, RTLD_LAZY);
    p = dlsym(h, "system");
    printf("Address of 'system': 0x%08x\n", p);
    p = dlsym(h, "exit");
    printf("Address of 'exit':   0x%08x\n", p);
    return 0;
}