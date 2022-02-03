

int addtwo(int x, int y) {
    int c;
    c = x + y;
    return c;
}

int addtwob(int x, int y, int* z) {
    *z = x + y;
}

int main() {
    int r1 = addtwo(3, 5);
    int z;
    addtwob(3, 4, &z);

}

//gcc -Og -S prog.c -fno-dwarf2-cfi-asm -fno-asynchronous-unwind-tables