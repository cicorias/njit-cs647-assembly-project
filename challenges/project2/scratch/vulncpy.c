#include <stdio.h>
#include <unistd.h>
#include <sys/types.h>
#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
void vulnFileCopy(char *userName);
void usage();
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
    char data[600];
    unsigned int i;
    FILE *fp;
    unsigned int size;
    // Initialize data to help vizualize stack contents
    i = 0;
    while (i < 600)
    {
        data[i] = 'A';
        i++;
    }
    printf("\nAddress of data buffer: %p\n", &data);
    printf("address of function exit() is :%p\n", exit);
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