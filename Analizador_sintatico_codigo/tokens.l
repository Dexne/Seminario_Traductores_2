%option noyywrap

%{
#include <stdio.h>
#define YY_DECL int yylex()
#include "parser.tab.h"

%}

%%
[ \t]	;
[0-9]+\.[0-9]+ 	{yylval.fval = atof(yytext); return T_FLOAT;}
[0-9]+		    {yylval.ival = atoi(yytext); return T_INT;}
\'[a-zA-z]\'    {yylval.cval = *yytext; return T_CHAR;}
[a-zA-z]        {yylval.cval = *yytext; return T_ID;}
\n		{return T_NEWLINE;}
"+"		{return T_PLUS;}
"-"		{return T_MINUS;}
"*"		{return T_MULTIPLY;}
"/"		{return T_DIVIDE;}
"="     {return T_ASSIGN;}
">"		{return T_GREATER;}
">="	{return T_GREATER_THAN;}
"<"		{return T_MINOR;}
"<="	{return T_MINOR_THAN;}
"=="	{return T_EQUAL;}
"!="	{return T_DIFFERENT;}
"and"	{return T_AND;}
"or"	{return T_OR;}
"{"		{return T_LWRENCH;}
"}"		{return T_RWRENCH;}
"("		{return T_LPARENTHESIS;}
")"		{return T_RPARENTHESIS;}
"int"	{return T_DT_INT;}
"float" {return T_DT_FLOAT;}
"char"	{return T_DT_CHAR;}
"if"	{return T_IF;}
"else"	{return T_ELSE;}
"for"   {return T_FOR;}
"while" {return T_WHILE;}
";"     {return T_SEMICOLON;}
"exit"	{return T_QUIT;}
"quit"	{return T_QUIT;}

%%
