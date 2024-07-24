/* 4. Criar um programa que reconheça os padrões antigos e novos de números de celulares e imprima */
/* “padrao antigo” e “padrao novo” para cada caso. */

/* antigo: XXXX-XXXX */
/* novo: 9XXXX-XXXX */

%{
    #include <stdio.h>
%}

DIGITO          [0-9]
CEL_ANTIGO      ([9876]{DIGITO}{DIGITO}{DIGITO}-{DIGITO}{DIGITO}{DIGITO}{DIGITO})
CEL_NOVO        9{CEL_ANTIGO}

%%

{CEL_ANTIGO}        { printf("Padrao Antigo(%d): %s\n", yyleng, yytext); }
{CEL_NOVO}          { printf("Padrao Novo(%d): %s\n", yyleng, yytext); }
(.*|\n|" ")         { }

%%

int yywrap() {
    return 1;
}

int main() {
    yylex();
    return 0;
}