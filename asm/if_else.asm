; If-Else em Assembly
; If-Else in Assembly
; Verifica se um número é positivo, negativo ou zero
; Checks if a number is positive, negative, or zero
; Usa instruções de salto condicional
; Uses conditional jump instructions
; Exibe mensagens diferentes para cada caso
; Displays different messages for each case
; Organiza o código com seções de dados e texto
; Organizes the code with data and text sections
; Usa chamadas de função para modularidade
; Uses function calls for modularity
; Alinha a pilha para conformidade com Win64
; Aligns the stack for Win64 compliance

BITS 64            ; define o modo de 64 bits; defines 64-bit mode

EXTERN puts        ; função para imprimir strings na tela; function to print strings to the screen
EXTERN exit        ; função para sair do programa; function to exit the program

SECTION .data
        positive_value DB "O numero e positivo; number is positive", 0      ; string para numero positivo; string for positive number
        negative_value DB "O numero e negativo; number is negative", 0
        zero_value     DB "O numero e zero; number is zero", 0

SECTION .text
        GLOBAL main

main:
        SUB RSP, 40            ; aloca espaço na pilha (alinhamento Win64); allocates stack space (Win64 alignment)

        MOV EAX, -5            ; teste: positivo / negativo / zero; test: positive / negative / zero
        CMP EAX, 0             ; compara eax com 0; compares eax with 0

        JE number_0        ; eax == 0
        JG positive_number     ; eax > 0
        JL negative_number     ; eax < 0

positive_number:
        MOV RCX, positive_value                 ; string para numero positivo; string for positive number
        CALL puts                               ; chama a função puts; calls the puts function
        JMP fim_if_else                         ; pula para o fim; jumps to the end

negative_number:
        MOV RCX, negative_value
        CALL puts
        JMP fim_if_else

number_0:
        MOV RCX, zero_value
        CALL puts

fim_if_else:
        XOR EAX, EAX           ; return 0
        ADD RSP, 40            ; restaura pilha; restores stack
        CALL exit