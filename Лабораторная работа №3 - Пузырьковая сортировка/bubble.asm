global _main
extern _printf

section .text
_main:
    mov ecx, 9

.outer_loop:
    lea r8, [rel array]
    xor ebx, ebx
    xor edx, edx

.inner_loop:
    cmp edx, ecx
    jge .inner_done       ; JGE: SF = OF, проход завершён

    mov eax, [r8]
    mov esi, [r8 + 4]

    cmp eax, esi
    jle .no_swap          ; JLE: ZF = 1 или SF != OF, левый <= правого

    mov [r8], esi
    mov [r8 + 4], eax
    mov ebx, 1            ; Был обмен

.no_swap:
    add r8, 4
    inc edx
    jmp .inner_loop       ; Безусловный переход

.inner_done:
    cmp ebx, 0
    je .done              ; JE: ZF = 1, обменов не было

    dec ecx
    jg .outer_loop        ; JG: ZF = 0 и SF = OF, проходы ещё нужны

.done:
    push r12
    push r13
    sub rsp, 8

    lea r12, [rel array]
    xor r13d, r13d

.print_loop:
    cmp r13d, 10
    jge .print_done       ; JGE: SF = OF, выведено 10 элементов

    lea rdi, [rel format_num]
    mov esi, [r12]
    xor eax, eax
    call _printf

    add r12, 4
    inc r13d
    jmp .print_loop

.print_done:
    lea rdi, [rel newline]
    xor eax, eax
    call _printf

    add rsp, 8
    pop r13
    pop r12

    xor eax, eax
    ret

section .data
    array: dd 7, 3, 10, 1, 6, 2, 9, 4, 8, 5
    format_num: db "%d ", 0
    newline: db 10, 0
