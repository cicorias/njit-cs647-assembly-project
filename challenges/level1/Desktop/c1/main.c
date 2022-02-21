#include <stdio.h>
#include <string.h>

	void function (char a, char b, char c, char * input)
	{
		int x = 10;
		short y = 24;
		char buffer[20] = {'\0'};
		char buffer2[16] = {'\0'};
		char buffer3[8] = {'\0'};

		strcpy(buffer2, input);
	}

    void main(int argc, char* argv[]) {
		int x;

		x = 0;
		function(1,2,3,argv[1]);
		x = 1;

		if (x == 0)
			printf("::: You lose :::\n");
		else if (x == 2){
			printf("::: You Win :::\n");
			//levelTwo()??
		}
		else
			printf("::: You lose :::\n");
	}