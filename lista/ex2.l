/* 2. Criar um scanner que deve imprimir: */
/* - “palavra reservada” quando a cadeia que o usuário digitar casar com alguma regra que represente */
/* uma palavra reservada (ex: “for”, “while”, “if”, “else”,…) */
/* - “caracter especial” quando a cadeia que o usuário digitar casar com algum caracter especial (ex: */
/* "^", "*", "&", "%", "$", "#") */
/* - para qualquer outra cadeia o scanner não deve fazer nada. */

/* não estou conseguindo representar o ( */

%{
    #include <stdio.h>
%}

RESERVADA   (for|while|if|else|switch|case|do|include|define|int|long|double|float|char|struct|typedef|main)
CHAR_ESPECIAL   [=!@#$%¨&*";.,/_+]

%%

{RESERVADA}     { printf("Palavra Reservada a): %s\n", yytext); }
{CHAR_ESPECIAL} { printf("Caracter Especial b): %s\n", yytext); }
(.*|\n|" ")           {/* faça nada */}

%%

int yywrap() {
    return 1;
}

int main() {
    yylex();

    return 0;
}