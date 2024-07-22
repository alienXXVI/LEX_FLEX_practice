%{ 
    // #define ECHO fwrite(yytext, yyleng, 1, yyout)
%}

%%

    /* match everything except newline */
. ECHO;
    /* match newline */
\n ECHO;

%%

int yywrap(void) {
    return 1;
}

int main(void) {
    yylex();
    return 0;
}