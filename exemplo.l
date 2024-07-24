/* -- DEFINIÇÕES -- */
%{

#include <stdio.h>
// #define ECHO fwrite(yytext, yyleng, 1, yyout) 

int maiuscula = 0;
int minuscula = 0;

%}


DIGITO          [0-9]
MINUSCULA       [a-z]
MAIUSCULA       [A-Z]


%%
    /* -- REGRAS -- */
{MINUSCULA}     {minuscula++;}
{MAIUSCULA}     {maiuscula++;}

%%
/* -- FUNÇÕES -- */

int yywrap() {
    return 1;
}

int main(int argc, char *argv[]) {
    // FILE *f
    // f = fopen("teste.txt", "r");
    // yyin = fopen("teste.txt", "r");
    // if(yyin == NULL) exit(1);

    // argv[0]  argv[1]
    // main     teste.txt
    yyin = fopen(argv[1], "r");
    if(yyin == NULL) exit(1);

    yylex(); // inicia o scanner

    printf("Minusculas: %d\nMaiuscula: %d\n", minuscula, maiuscula);

    return 0;
}