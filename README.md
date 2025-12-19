# Learn ASM (vs Java)

Este repositório documenta a minha jornada de aprendizagem em **Assembly x64**, utilizando **Java** como linguagem de referência. A ideia é implementar a mesma lógica em ambas as linguagens para entender como construções de alto nível são traduzidas para instruções de baixo nível e chamadas de sistema.

## 📂 Estrutura do Projeto

O projeto está dividido pela linguagem utilizada:

`learn-asm/`
* **`asm/`**: Código fonte em Assembly (Sintaxe NASM)
    * `hello.asm`
    * `if_else.asm`
    * `simple_calculator.asm`
* **`java/`**: Código fonte em Java (Referência Lógica)
    * `Hello.java`
    * `IfElse.java`
    * `SimpleCalculator.java`
* **`.gitignore`**: Arquivos ignorados (binários e objetos)

## 🚀 Exemplos Implementados (Até o presente momento)

Atualmente, o projeto conta com as seguintes comparações:

| Conceito | Arquivo Java | Arquivo Assembly | Descrição |
| :--- | :--- | :--- | :--- |
| **Output Básico** | `Hello.java` | `hello.asm` | Comparação entre `System.out.println` e a função externa `puts` da LibC. |
| **Condicionais** | `IfElse.java` | `if_else.asm` | Lógica de decisão (`if/else if/else`) traduzida para instruções de comparação (`CMP`) e saltos (`JE`, `JG`, `JL`). |
| **Calculadora** | `SimpleCalculator.java` | `simple_calculator.asm` | Operações aritméticas (`+`, `-`, `*`, `/`) e métodos traduzidos para instruções matemáticas (`ADD`, `SUB`, `IMUL`, `DIV`) e chamadas de função (`CALL`, `RET`). |

## 🛠️ Pré-requisitos

Para compilar e rodar os códigos, precisará de:

1.  **Java JDK** (para os arquivos `.java`).
2.  **NASM** (Netwide Assembler) para montar o código Assembly.
3.  **GCC** (MinGW-w64) para "linkar" os objetos e fornecer as funções da biblioteca C (como `puts` e `exit`).

## 💻 Como Compilar e Rodar

### ☕ Java
Para rodar os exemplos em Java:

```bash
# Compilar
javac java/Hello.java

# Executar
java -cp java Hello
⚙️ Assembly (Windows x64)
Os exemplos em Assembly utilizam a convenção de chamada do Windows (Microsoft x64 calling convention) e dependem da biblioteca C.

Bash

# 1. Montar o código objeto (Substitua 'arquivo' pelo nome desejado, ex: hello)
nasm -f win64 asm/arquivo.asm -o arquivo.o

# 2. Linkar usando GCC (Isso conecta as funções 'puts' e 'exit')
gcc arquivo.o -o arquivo.exe

# 3. Executar
./arquivo.exe
🔍 Detalhes Técnicos Observados
Chamadas de Função: Enquanto o Java abstrai a chamada de sistema, no Assembly precisamos alocar o shadow space na pilha (SUB RSP, 40) antes de chamar funções externas no Windows.

Estrutura: O código Assembly está estruturado com seções .data (para strings e constantes) e .text (para o código executável).

Integração com C: O uso de EXTERN puts e EXTERN exit permite utilizar funções da biblioteca padrão do C para facilitar a entrada e saída de dados.
