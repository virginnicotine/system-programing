global _main
extern _printf

section .text
_main:
    ; Считаем выражение по схеме Горнера
    mov eax, [rel a]
    imul eax, [rel x]
    add eax, [rel b]
    imul eax, [rel x]
    add eax, [rel c]

    ; Выводим ответ
    lea rdi, [rel format_str]
    mov esi, eax
    xor eax, eax
    sub rsp, 8
    call _printf
    add rsp, 8

    ; Завершаем программу
    xor eax, eax
    ret

section .data
    a: dd 2
    b: dd 3
    c: dd 4
    x: dd 5
    format_str: db "Результат: %d", 10, 0
