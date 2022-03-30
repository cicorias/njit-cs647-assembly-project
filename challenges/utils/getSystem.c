#include <stdio.h>
#include <dlfcn.h>

// compile with: (x64)  gcc -o getSystem getSystem.c -ldl
// compile with: (i386) gcc -m32 -o getSystem getSystem.c -ldl
// -ldl -- link to libdl.so

int main(int argc, char *argv[]) {
    void *h, *ps, *pe;
    h = dlopen(NULL, RTLD_LAZY);
    ps = dlsym(h, "system");
    printf("Address of 'system': 0x%08x\n", ps);
    pe = dlsym(h, "exit");
    printf("Address of 'exit':   0x%08x\n", pe);
    printf("Offset system-exit:  0x%08x\n", ps - pe );

    return 0;
}