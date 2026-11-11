global _main
extern _printf

section .text
_main:
    ; Вычисляем (a * x + b) * x + c
    mov eax, [rel a]       ; Загружаем a
    imul eax, [rel x]      ; a * x
    add eax, [rel b]       ; a * x + b
    imul eax, [rel x]     ; (a * x + b) * x
    add eax, [rel c]       ; (a * x + b) * x + c

    ; Выводим результат
    lea rdi, [rel format_str]
    mov esi, eax
    xor eax, eax
    sub rsp, 8             ; Выравниваем стек перед вызовом функции
    call _printf
    add rsp, 8             ; Восстанавливаем стек

    ; Завершение программы
    xor eax, eax
    ret

section .data
    a: dd 2
    b: dd 3
    c: dd 4
    x: dd 5
    format_str: db "Результат: %d", 10, 0
