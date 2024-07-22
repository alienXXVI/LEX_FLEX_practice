/* a) Cadeias de letras em caixa baixa começando e terminando com a. */
/* b) Cadeias de dígitos sem zeros à esquerda. */
/* c) Cadeias de dígitos que representam números pares */
%{
    #include <stdio.h>
%}

MINUSCULAS      [a-z]
DIGITO          [0-9]

%%

(a{MINUSCULAS}*a)|a     { printf("cadeia valida a): %s\n", yytext); }
[1-9]{DIGITO}*          { printf("cadeia valida b): %s\n", yytext); }
([1-9]{DIGITO}*[24680])|([24680])        { printf("cadeia valida c): %s\n", yytext); }
.*|\n                   { printf("cadeia invalida: %s\n", yytext);}

%%

int yywrap() {
    return 1;
}

int main() {
    yylex();

    return 0;
}