%option noyywrap

%{
    #include "prog.tab.h"
%}

delim [ \t\n]
ws {delim}+
digit [0-9]
number ({digit}+)
letter [A-Za-z]
us [_]
id ({us}|{letter})({letter}|{us}|{digit})*

%%
{ws} {}
{number} {yylval = atoi(yytext); return(NUM); printf("NUM\n");}

"if" {return(IF);}
"while" {return(WHILE);}

{id} {return(ID); printf("ID\n");}

"==" {return(EQUAL);}
"=" {return(ASSIGN);}
";" {return(SEMI);}

"+" {return(ADD);}
"-" {return(SUB);}

"(" {return(LP);}
")" {return(RP);}

"{" {return(LB);}
"}" {return(RB);}

"int" {return(INT);}
"double" {return(DOUBLE);}
"float" {return(FLOAT);}
%%

