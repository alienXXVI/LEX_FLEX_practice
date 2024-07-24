/* 5. Criar um programa que imprima: “O CNPJ xxxxxxxx/xxxx-xx eh válido” para números de */
/* CNPJs que são válidos, sendo que no lugar dos xxxx…. você deve imprimir o número do CNPJ */
/* digitado pelo usuário que casou com a regra criada. */

%{
    #include <stdio.h>
%}

DIGITO      [0-9]
DIGITO4     ({DIGITO}{DIGITO}{DIGITO}{DIGITO})
CNPJ        ({DIGITO4}{DIGITO4}"/"{DIGITO4}-{DIGITO}{DIGITO})

%%
{CNPJ}          { printf("O CNPJ %s eh valido\n", yytext); }
(.*|\n|" ")     { }

%%

int yywrap() {
    return 1;
}

int main() {
    yylex();
    return 0;
}