%{
#include <stdio.h>
void yyerror(char *s);
int yylex();
%}

%token NUM ADD SUB FLOAT_NUM ID MUL
%start cal
%left ADD SUB

%%
cal: exp {$$=$1; printf("=%d\n", $$); printf("cal: exp %d\n", $$);}
    ;

exp: exp ADD NUM {$$=$1+$3; printf("exp: exp ADD NUM %d\n", $$);}
    |exp SUB NUM {$$=$1-$3; printf("exp: exp SUB NUM %d\n", $$);} 
    |exp MUL NUM {$$=$1*$3; printf("exp: exp MUL NUM %d\n", $$);} 
    |NUM {$$=$1; printf("exp: NUM %d\n", $$);}
    ; 
%%

int main()
{
    yyparse();
    printf("Parsing Finished\n");
}

void yyerror(char *s)
{
    fprintf(stderr, "error: %s", s);
}
