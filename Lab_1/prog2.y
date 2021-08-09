%{
#include <stdio.h>
void yyerror(char *s);
int yylex();
%}

%token NUM ADD SUB ID ASSIGN SEMI IF LB RB LP RP EQUAL WHILE INT DOUBLE FLOAT MAIN KEYWORD FLOAT_NUM DATATYPE FN_DEF PRINTER COMMA
%start program
%left ADD SUB

%%
program: FN_DEF ID LP variables RP LB print_statements RB
    ;

variables: ID | ID COMMA variables
    ;

print_statements: PRINTER LP ID RP SEMI | PRINTER LP ID RP SEMI print_statements
    ;


program2: DATATYPE MAIN LP RP LB statements RB;
    ;

statements: id_declare statements
            | if_condition statements 
            | while_condition statements
            | exp statements
            | id_assign statements
            | id_declare
            | if_condition
            | while_condition
            | exp
            | id_assign
            ;

id_declare: DATATYPE ID ASSIGN exp SEMI
            ;

if_condition: IF LP exp RP LB statements RB
    ;

while_condition: WHILE LP exp RP LB statements RB
    ;

id_assign: ID ASSIGN exp SEMI
    ;

exp: exp ADD ID
    |exp SUB ID
    |exp EQUAL ID
    |exp ADD number
    |exp SUB number
    |exp EQUAL number
    |number
    |ID
    ;

number: NUM
        | SUB NUM
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
