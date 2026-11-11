global _main
extern _printf

section .text
_main:
    ; Загружаем первое и второе числа
    mov eax, [rel num1]
    mov ebx, [rel num2]

    ; Складываем числа: результат сохраняется в eax
    add eax, ebx

    ; Подготавливаем аргументы функции printf
    lea rdi, [rel format_str]
    mov esi, eax
    xor eax, eax
    call _printf

    ; Возвращаем код успешного завершения
    xor eax, eax
    ret

section .data
    num1: dd 15
    num2: dd 27
    format_str: db "Сумма: %d", 10, 0
