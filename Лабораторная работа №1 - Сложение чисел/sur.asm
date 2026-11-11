global _main
extern _printf

section .text
_main:
    ;  Сложение чисел 
    mov eax, [rel num1] ; Загружаем первое число
    mov ebx, [rel num2] ; Загружаем второе число
    add eax, ebx        ; Складываем, результат в eax

    ;  Вывод на экран 
    lea rdi, [rel format_str] ; 1-й аргумент: строка формата
    mov esi, eax              ; 2-й аргумент: наша сумма
    xor eax, eax              ; Обязательно обнулить eax перед вызовом printf
    call _printf              ; Вызов функции печати

    ;  Завершение 
    xor eax, eax              ; Код возврата 0 (успех)
    ret

section .data
    num1: dd 15
    num2: dd 27
    format_str: db "Сумма: %d", 10, 0
