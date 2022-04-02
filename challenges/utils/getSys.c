#include <stdio.h>
#include <dlfcn.h>

int main(int argc, char *argv[]) {
    void *h, *p;
    h = dlopen(NULL, RTLD_LAZY);
    p = dlsym(h, "system");
    printf("Address of 'system': 0x%08x\n", p);
    p = dlsym(h, "exit");
    printf("Address of 'exit':   0x%08x\n", p);
    return 0;
}

