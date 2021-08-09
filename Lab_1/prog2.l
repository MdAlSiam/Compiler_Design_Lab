%option noyywrap

%{
    #include "newprog.tab.h"
%}

main ("main")
delim [ \t\n]
ws {delim}+
digit [0-9]
number ({digit}+)
point (".")
float_number ({digit})*({point})({digit})+
datatype ("int"|"float"|"double")
letter [A-Za-z]
us [_]
id ({us}|{letter})({letter}|{us}|{digit})*
comparator ("=="|"<"|">")
assignment ("=")
operator ("+"|"-"|"*"|"/")

%%
{main} {printf("MAIN\n"); return(MAIN);}
{ws} {}
{number} {printf("%s NUM\n", yytext); return(NUM);}
{float_number} {printf("%s FLOAT_NUM\n", yytext); return(FLOAT_NUM);}
{datatype} {printf("%s DATATYPE\n", yytext); return(DATATYPE);}
"function" {printf("%s FN_DEF\n", yytext); return(FN_DEF);}
"console.log" {printf("%s PRINTER\n", yytext); return(PRINTER);}
"if" {printf("%s IF\n", yytext); return(IF);}
"while" {printf("%s WHILE\n", yytext); return(WHILE);}
{id} {printf("%s ID\n", yytext); return(ID);}

"==" {printf("%s EQUAL\n", yytext); return(EQUAL);}
"=" {printf("%s ASSIGN\n", yytext); return(ASSIGN);}
";" {printf("%s SEMICOLON\n", yytext); return(SEMI);}

"+" {printf("%s ADD\n", yytext); return(ADD);}
"-" {printf("%s SUB\n", yytext); return(SUB);}

"(" {printf("%s LP\n", yytext); return(LP);}
")" {printf("%s RP\n", yytext); return(RP);}

"{" {printf("%s LB\n", yytext); return(LB);}
"}" {printf("%s RB\n", yytext); return(RB);}

"," {printf("%s COMMA\n",yytext); return(COMMA);}
%%
