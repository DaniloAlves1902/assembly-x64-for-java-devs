bits 64

EXTERN puts             ; função para imprimir strings na tela
EXTERN exit             ; função para sair do programa

SECTION .data
        hello_world_string DB "Ola mundo", 0
        other_string       DB "Outra string", 0 

SECTION .text
        GLOBAL main             ; ponto de entrada do programa

main:
        SUB RSP, 40             ; aloca espaço na pilha

        MOV RCX, hello_world_string
        CALL puts               ; chama a função puts para imprimir a string

        MOV RCX, other_string
        CALL puts       

        ADD RSP, 40             ; desaloca espaço na pilha

        XOR EAX, EAX            ; código de saída 0
        CALL exit               ; chama a função exit para sair do programa