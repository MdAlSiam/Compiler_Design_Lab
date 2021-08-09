%option noyywrap

%{
    #include "cal.tab.h"
%}

delim [ \t]
ws {delim}+

digit [0-9]
number ({digit}+)

point [.]
float_number ({digit})*({point})({digit})+

us [_]
letter [a-zA-Z]
id ({us}|{letter})({letter}|{us}|{digit})*
key ("main"|"while")

datatype ("int"|"float"|"double")

%%
{ws} {}
{number} {yylval = atoi(yytext); return(NUM);}
{float_number} {yylval = atoi(yytext); return(FLOAT_NUM);}
{id} {return(ID);}
"+" {return(ADD);}
"-" {return(SUB);}
"*" {return(MUL);}
%%
