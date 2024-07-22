/* -- DEFINIÇÕES -- */
/* Porblema: última linha do arquivo não segue formato */

%{

int yylineno;

%}

%%
    /* -- REGRAS -- */
            /* incrementa yylineno (que conta o número de linhas) e imprime o número da
            linha seguido do texto da linha (yytext)*/
^(.*)\n     printf("%4d\t%s", ++yylineno, yytext); /* corresponde a qualquer linha de texto */

%%
/* -- FUNÇÕES -- */

int yywrap() {
    return 1;
}

int main(int argc, char *argv[]) {
    yyin = fopen(argv[1], "r");
    yylex();
    fclose(yyin);
} 