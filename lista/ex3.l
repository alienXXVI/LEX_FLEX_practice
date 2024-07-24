/* 3. Criar um scanner que reconheça as seguintes macros: dígito, números naturais, números inteiros, */
/* números reais, letras, identificadores, operadores aritméticos, operadores lógicos e operadores */
/* relacionais. Para cada um, imprima a cadeia que casou com a expressão e seu tamanho. */
/* Dica: usar variáveis predefinidas pelo Lex, como: */
/* char *yytext */
/* int yyleng */

/* Naturais 90 9 91 0 999 */
/* Inteiros -1 -20 +20 +0 -0 0 20 */

%{
    #include <stdio.h>
%}

DIGITO              [0-9]
NATURAIS_SEM_ZERO   [1-9]
NATURAIS            (({NATURAIS_SEM_ZERO}{DIGITO}*)|0)
INTEIROS            [-+]?{NATURAIS}
REAIS               {INTEIROS}([.,]{DIGITO}*)?
LETRAS              [a-zA-Z]
IDENTIFICADORES     (_|{LETRAS})(_|{LETRAS}|{DIGITO})*
OP_ARITMETICOS      [-+*/=]
OP_LOGICOS          ("||"|"&&"|"^")
OP_RELACIONAIS      (">"|"<"|">="|"<="|"=="|"!=")

%%
{DIGITO}            { printf("Digito(%d): %s\n", yyleng, yytext); }
{NATURAIS}          { printf("Natural(%d): %s\n", yyleng, yytext); }
{INTEIROS}          { printf("Inteiro(%d): %s\n", yyleng, yytext); }
{REAIS}             { printf("Real(%d): %s\n", yyleng, yytext); }
{LETRAS}            { printf("Letra(%d): %s\n", yyleng, yytext); }
{IDENTIFICADORES}   { printf("Identificador(%d): %s\n", yyleng, yytext); }
{OP_ARITMETICOS}    { printf("Op. Aritmetico(%d): %s\n", yyleng, yytext); }
{OP_LOGICOS}        { printf("Op. Logico(%d): %s\n", yyleng, yytext); }
{OP_RELACIONAIS}    { printf("Op. Relacional(%d): %s\n", yyleng, yytext); }
(.*|\n)         { /* faça nada */ }

%%

int yywrap() {
    return 1;
}

int main() {
    yylex();
    return 0;
}