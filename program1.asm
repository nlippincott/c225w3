; Hello World in NASM assembly

global _start           ; expose program entry point

section .text           ; start of code segment

_start:

    ; Write "Hello World!" to the console
    mov rax,[var1]
    add rax,[var2]
    mov [var3],RAX

    ;mov [var1],[var3]
    mov rdx,[var3]
    mov [var1],rdx      

    inc rax 
    inc qword[var1]

    ; End the program
    mov rax,0x3c            ; system call for exit 
    xor rdi,rdi             ; exit code 0
    syscall                 ; invoke operating system call 

section .data           ; start of initialized data segment

    hello_str db "Hello World!",0xa     ; output string with newline
    hello_str_len equ $-hello_str       ; size of output string 

    var1 dq 5
    var2 dq 7,11,2,-1

    var4 dd 8,2,4,-1

section .bss            ; start of uninitialized data segment 
    var3 resq 1
