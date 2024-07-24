/* 6. Criar um programa similar ao do exercício 3, mas ao invés das cadeias serem digitadas pelo */
/* teclado, elas devem estar salvas em um arquivo .txt e ser lido pelo seu programa. */

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

int main(int argc, char *argv[]) {
    // argv[0]  argv[1]
    // main     teste.txt
    yyin = fopen(argv[1], "r");
    if(yyin == NULL) exit(1);
    yylex();
    return 0;
}