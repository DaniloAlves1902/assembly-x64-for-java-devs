; Calculadora Simples em Assembly
; Simple Calculator in Assembly
; Realiza operações básicas: soma, subtração, multiplicação e divisão
; Performs basic operations: addition, subtraction, multiplication, and division
; Usa chamadas de função para organizar o código
; Uses function calls to organize the code 
; Exibe resultados formatados usando printf
; Displays formatted results using printf
; Alinha a pilha para conformidade com Win64
; Aligns the stack for Win64 compliance 

BITS 64                ; define o modo de 64 bits; defines 64-bit mode
DEFAULT REL

EXTERN printf          ; função para imprimir strings formatadas; function to print formatted strings 
EXTERN exit            ; função para sair do programa; function to exit the program

SECTION .data
        format_string_sum DB "Resultado (10 + 5): %d", 10, 0        ; string formatada para soma; formatted string for sum
        format_string_sub DB "Resultado (10 - 5): %d", 10, 0
        format_string_mul DB "Resultado (10 * 5): %d", 10, 0
        format_string_div DB "Resultado (10 / 5): %d", 10, 0

SECTION .text
        GLOBAL main

main:
        SUB RSP, 40       ; aloca espaço na pilha; allocates stack space

; realiza operações básicas; performs basic operations
; Soma; Addition

        MOV ECX, 10       ; primeiro operando; first operand
        MOV EDX, 5        ; segundo operando; second operand
        CALL sum          ; chama a função de soma; calls the sum function

        LEA RCX, [format_string_sum]        ; prepara a string formatada; prepares the formatted string
        MOV EDX, EAX        ; resultado da soma; result of the sum
        CALL printf         ; chama printf; calls printf

; Subtração; Subtraction

        MOV ECX, 10
        MOV EDX, 5  
        CALL subtract      ; chama a função de subtração; calls the subtract function
        
        LEA RCX, [format_string_sub]
        MOV EDX, EAX
        CALL printf

; Multiplicação; Multiplication

        MOV ECX, 10
        MOV EDX, 5  
        CALL multiply      ; chama a função de multiplicação; calls the multiply function

        LEA RCX, [format_string_mul]
        MOV EDX, EAX
        CALL printf

; Divisão; Division

        MOV ECX, 10
        MOV EDX, 5
        CALL divide

        LEA RCX, [format_string_div]
        MOV EDX, EAX
        CALL printf

        JMP finalize       ; pula para finalização; jumps to finalization

sum:
        MOV EAX, ECX        ; move o primeiro operando para eax; moves the first operand to eax
        ADD EAX, EDX        ; soma o segundo operando; adds the second operand
        RET

subtract:
        MOV EAX, ECX
        SUB EAX, EDX
        RET

multiply:
        MOV EAX, ECX
        IMUL EAX, EDX
        RET

divide:
        MOV EAX, ECX      ; EAX = a; EDX = b
        MOV ECX, EDX      ; salva divisor em ECX; saves divisor in ECX
        XOR EDX, EDX      ; zera parte alta; clears high part   
        DIV ECX           ; EAX = a / b
        RET


finalize:
        ADD RSP, 40
        XOR ECX, ECX      ; código de saída 0; exit code 0
        CALL exit
