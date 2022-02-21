// #include "stdio.h"
// #include <stdio.h>
// #include <inttypes.h>

int add_foo(int, int);

int main() {
    int c;
    c = add_foo(2,4);
    // printf("result is %d", c);

    return 0;
}

//  gcc -std=c99 callmaxofthree.c maxofthree.s && ./a.out