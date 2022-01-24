# Some notes

example case of input Listing 8.1: uppercaser1.asm 


 (Duntemann)

Duntemann, Jeff. Assembly Language Step-by-Step,  3rd Edition. Wiley Professional, Reference & Trade, 20110303.  VitalBook file.

vbk://9781118080993/epubcfi/6/34%5B%3Bvnd.vst.idref%3Dc08%5D!/4/2/436/1:0

http://www.duntemann.com/assembly.html


```
section .bss
        Buff resb 1
 
section .data
 
section .text
        global _start
 
_start:
        nop            ; This no-op keeps the debugger happy
 
Read:   mov eax,3      ; Specify sys_read call
        mov ebx,0      ; Specify File Descriptor 0: Standard Input
        mov ecx,Buff   ; Pass address of the buffer to read to
        mov edx,1      ; Tell sys_read to read one char from stdin
        int 80h        ; Call sys_read
 
        cmp eax,0      ; Look at sys_read's return value in EAX
        je Exit        ; Jump If Equal to 0 (0 means EOF) to Exit
                       ; or fall through to test for lowercase
        cmp byte [Buff],61h  ; Test input char against lowercase ‘a’
        jb Write       ; If below ‘a’ in ASCII chart, not lowercase
        cmp byte [Buff],7Ah  ; Test input char against lowercase ‘z’
        ja Write       ; If above ‘z’ in ASCII chart, not lowercase
                       ; At this point, we have a lowercase character
        sub byte [Buff],20h  ; Subtract 20h from lowercase to give uppercase...
                       ; ...and then write out the char to stdout
Write:  mov eax,4      ; Specify sys_write call
        mov ebx,1      ; Specify File Descriptor 1: Standard output
        mov ecx,Buff   ; Pass address of the character to write
        mov edx,1      ; Pass number of chars to write
        int 80h        ; Call sys_write...
        jmp Read       ; ...then go to the beginning to get another character
 
Exit:   mov eax,1      ; Code for Exit Syscall
        mov ebx,0      ; Return a code of zero to Linux
        int 80H        ; Make kernel call to exit program

```