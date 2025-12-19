; Hello World em Assembly
; Hello World in Assembly
; Imprime "Ola mundo, Hello World" na tela
; Prints "Olá mundo, Hello World" to the screen
; Imprime outra string "Outra string, Another string"
; Prints another string "Another string, Another string"
; Uses a função puts para exibir as strings
; Uses the puts function to display the strings
; Organiza o código com seções de dados e texto
; Organizes the code with data and text sections
; Usa chamadas de função para modularidade
; Uses function calls for modularity
; Alinha a pilha para conformidade com Win64
; Aligns the stack for Win64 compliance 

BITS 64                 ; define o modo de 64 bits; defines 64-bit mode 

EXTERN puts             ; função para imprimir strings na tela; function to print strings to the screen
EXTERN exit             ; função para sair do programa; function to exit the program

SECTION .data
        hello_world_string DB "Ola mundo, Hello World", 0        ; string "Ola mundo"; "Hello world" string
        another_string       DB "Outra string, Another string", 0     ; outra string; another string

SECTION .text
        GLOBAL main             ; ponto de entrada do programa; program entry point

main:
        SUB RSP, 40             ; aloca espaço na pilha; allocates stack space

        MOV RCX, hello_world_string
        CALL puts               ; chama a função puts para imprimir a string; calls the puts function to print the string

        MOV RCX, other_string
        CALL puts       

        ADD RSP, 40             ; desaloca espaço na pilha; deallocates stack space

        XOR EAX, EAX            ; código de saída 0; exit code 0
        CALL exit               ; chama a função exit para sair do programa; calls the exit function to exit the program