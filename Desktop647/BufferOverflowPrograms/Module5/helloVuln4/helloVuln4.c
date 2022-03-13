#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>

void vulnFunction(char *input) {
	char buffer[16] = {'\0'};

	printf("Address of %s: %p\n", "shellcode", getenv("shellcode"));

	strcpy(buffer, input); //copy input to buffer
	printf("Hello %s!\n",buffer);
}

int main(int argc, char *argv[]) {
	
	if (!(setreuid(0, 0)==0)) 	//Get studentroot(owner) priviledges
		printf("\nSetuid failed.\n");

	vulnFunction(argv[1]);
}
