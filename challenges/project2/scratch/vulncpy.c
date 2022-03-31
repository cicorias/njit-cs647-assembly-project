#include <stdio.h>
#include <unistd.h>
#include <sys/types.h>
#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <dlfcn.h>

// compile with: (x64)  gcc -o getSystem getSystem.c -ldl
// compile with: (i386) gcc -m32 -o getSystem getSystem.c -ldl
// -ldl -- link to libdl.so
#define SIZE 200
void vulnFileCopy(char *userName);
void usage();
void getSystem();
void main(int argc, char *argv[])
{
    /***********************************
     ****                            ****
     ***                              ***
     **              CODE              **
     *             REDACTED             *
     **    DOES NOT AFFECT EXPLOIT!    **
     ***                              ***
     ****                            ****
     ************************************/
    if (argc == 2)
        vulnFileCopy(argv[1]);
    else
        usage();
    return;
}
void vulnFileCopy(char *fileName)
{
    char data[SIZE];
    unsigned int i;
    FILE *fp;
    unsigned int size;
    // Initialize data to help vizualize stack contents
    i = 0;
    while (i < SIZE)
    {
        data[i] = 'A';
        i++;
    }
    printf("\nAddress of data buffer: %p\n", &data);
    getSystem();
    i = 0;
    printf("\nFile to copy: ");
    printf(fileName);
    printf("\n");
    printf("\nPress enter to begin copying...");
    getchar();
    fp = fopen(fileName, "r");
    if (fp == NULL)
    {
        perror("\nERROR Opening file. Exiting...\n");
        exit(0);
    }
    fseek(fp, 0, SEEK_END); // Get file size
    size = ftell(fp);
    rewind(fp);
    i = 0;
    while (i < size) // Copy data from input file to data buffer
    {
        data[i] = fgetc(fp);
        i++;
    }
    fclose(fp);
    printf("\nDone copying.\n");
    return;
}
void usage()
{
    printf("\nUsage: ./vulnFileCopy2 [file_name]\n");
}

#define RTLD_LAZY 0x00001
void getSystem() {
    void *h, *ps, *pe;
    h = dlopen(NULL, RTLD_LAZY);
    ps = dlsym(h, "system");
    pe = dlsym(h, "exit");
    printf("Address of 'system': 0x%08x\n", ps);
    printf("Address of 'exit':   0x%08x\n", pe);
    printf("Offset system-exit:  0x%08x\n", ps - pe );
}