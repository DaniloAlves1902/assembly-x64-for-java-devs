BITS 64

EXTERN puts        ; função para imprimir strings na tela
EXTERN exit        ; função para sair do programa

SECTION .data
        valor_positivo DB "O numero e positivo", 0
        valor_negativo DB "O numero e negativo", 0
        valor_zero     DB "O numero e zero", 0

SECTION .text
        GLOBAL main

main:
        SUB RSP, 40            ; aloca espaço na pilha (alinhamento Win64)

        MOV EAX, -5            ; teste: positivo / negativo / zero
        CMP EAX, 0             ; compara eax com 0

        JE numero_zero         ; eax == 0
        JG numero_positivo     ; eax > 0
        JL numero_negativo     ; eax < 0

numero_positivo:
        MOV RCX, valor_positivo
        CALL puts
        JMP fim_if_else

numero_negativo:
        MOV RCX, valor_negativo
        CALL puts
        JMP fim_if_else

numero_zero:
        MOV RCX, valor_zero
        CALL puts

fim_if_else:
        XOR EAX, EAX           ; return 0
        ADD RSP, 40            ; restaura pilha
        CALL exit