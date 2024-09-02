section .text
    global _start

_start:
    mov ecx, 10
    xor eax, eax

loop:
    add eax, ecx
    dec ecx
    jnz loop

; exit
    mov eax, 60
    xor edi, edi
    syscall