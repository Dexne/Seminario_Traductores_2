%{
// indicamos que es codigo de C
#include <stdio.h>
#include <stdlib.h>

// indicamos que esta definido en otra ubicacion
extern int yylex();
extern int yyparse();
extern FILE* yyin;

// definicion
void yyerror(const char* s);
%}


%union {
	int ival; 
	float fval;
	char cval;
}

%token<ival> T_INT
%token<fval> T_FLOAT
%token<cval> T_CHAR

%token T_PLUS T_MINUS T_MULTIPLY T_DIVIDE
%token T_IF T_ELSE T_FOR T_WHILE
%token T_LWRENCH T_RWRENCH T_LPARENTHESIS T_RPARENTHESIS T_SEMICOLON T_ASSIGN T_COMILLA
%token T_DT_INT T_DT_FLOAT T_DT_CHAR T_ID
%token T_MINOR T_GREATER T_MINOR_THAN T_GREATER_THAN T_EQUAL T_DIFFERENT T_AND T_OR
%token T_NEWLINE T_QUIT
%left T_PLUS T_MINUS
%left T_MULTIPLY T_DIVIDE

// valor de retorno a los tipos de reglas
%type<ival> op_int
%type<fval> op_float
%type<ival> cmp
%type<ival> conditional
%type<ival> assignment
%type<ival> cycle

%start initial

%%

initial:
	| initial line
;

line
	: T_NEWLINE
    | op_float T_NEWLINE { printf("\tResult: %f\n", $1);}
    | op_int T_NEWLINE { printf("\tResult: %i\n", $1); }
	| conditional T_NEWLINE { printf("Result is: %i\n", $1); }
	| assignment T_NEWLINE  { printf("Assignment: %i\n", $1); }
	| cycle T_NEWLINE  { printf("Cycle: %i\n", $1); }
    | T_QUIT T_NEWLINE { printf("bye!\n"); exit(0); }
;

cycle
	: T_FOR T_LPARENTHESIS assignment cmp op_int T_RPARENTHESIS {$$ = $4;}
	| T_FOR T_LPARENTHESIS assignment cmp op_float T_RPARENTHESIS {$$ = $4;}
	| T_WHILE T_LPARENTHESIS cmp T_RPARENTHESIS {$$ = $3;}
;

assignment
	: T_DT_INT T_ID T_SEMICOLON {$$ = 1;}
	| T_DT_INT T_ID T_ASSIGN T_INT T_SEMICOLON  {$$ = $4;}
	| T_DT_INT T_ID T_ASSIGN op_int T_SEMICOLON  {$$ = $4;}
	| T_DT_CHAR T_ID T_SEMICOLON {$$ = 1;}
	| T_DT_CHAR T_ID T_ASSIGN T_CHAR T_SEMICOLON {$$ = 1;}
	| T_DT_FLOAT T_ID T_SEMICOLON {$$ = 1;}
	| T_DT_FLOAT T_ID T_ASSIGN T_FLOAT T_SEMICOLON {$$ = 1;}
	| T_DT_FLOAT T_ID T_ASSIGN op_int T_SEMICOLON {$$ = 1;}
	| T_DT_FLOAT T_ID T_ASSIGN op_float T_SEMICOLON {$$ = 1;}
;

conditional
	: T_IF T_LPARENTHESIS cmp T_RPARENTHESIS	{ $$ = $3; }
;

cmp
	:	op_int T_MINOR op_int 			{ $$ = $1 < $3; }
	|	op_int T_GREATER op_int 		{ $$ = $1 > $3; }
	|	op_int T_MINOR_THAN op_int 		{ $$ = $1 <= $3; }
	|	op_int T_GREATER_THAN op_int 	{ $$ = $1 >= $3; }
	|	op_int T_EQUAL op_int 			{ $$ = $1 == $3; }
	|	op_int T_DIFFERENT op_int 		{ $$ = $1 != $3; }
	|   op_int T_AND op_int				{ $$ = $1 && $3; }
	|   op_int T_OR op_int				{ $$ = $1 || $3; }
	|	T_ID T_MINOR op_int 			{ $$ = 1; }
	|	T_ID T_GREATER op_int 			{ $$ = 1; }
	|	T_ID T_MINOR_THAN op_int 		{ $$ = 1; }
	|	T_ID T_GREATER_THAN op_int 		{ $$ = 1; }
	|	T_ID T_EQUAL op_int 			{ $$ = 1; }
	|	T_ID T_DIFFERENT op_int 		{ $$ = 1; }
	|   T_ID T_AND op_int				{ $$ = 1; }
	|   T_ID T_OR op_int				{ $$ = 1; }
	|	T_ID T_MINOR T_ID 				{ $$ = 1; }
	|	T_ID T_GREATER T_ID 			{ $$ = 1; }
	|	T_ID T_MINOR_THAN T_ID 			{ $$ = 1; }
	|	T_ID T_GREATER_THAN T_ID 		{ $$ = 1; }
	|	T_ID T_EQUAL T_ID 				{ $$ = 1; }
	|	T_ID T_DIFFERENT T_ID 			{ $$ = 1; }
	|   T_ID T_AND T_ID					{ $$ = 1; }
	|   T_ID T_OR T_ID					{ $$ = 1; }
	|   T_LPARENTHESIS cmp T_RPARENTHESIS { $$ = $2; }
	|   T_LPARENTHESIS cmp T_AND cmp T_RPARENTHESIS { $$ = $2 && $4; }
	|   T_LPARENTHESIS cmp T_OR cmp T_RPARENTHESIS { $$ = $2 || $4; }
;

op_float
	: T_FLOAT                 		 { $$ = $1; }
	| op_float T_PLUS op_float	 { $$ = $1 + $3; }
	| op_float T_MINUS op_float	 { $$ = $1 - $3; }
	| op_float T_MULTIPLY op_float { $$ = $1 * $3; }
	| op_float T_DIVIDE op_float	 { $$ = $1 / $3; }
	| T_LPARENTHESIS op_float T_RPARENTHESIS		 { $$ = $2; }
	| op_int T_PLUS op_float	 	 { $$ = $1 + $3; }
	| op_int T_MINUS op_float	 	 { $$ = $1 - $3; }
	| op_int T_MULTIPLY op_float 	 { $$ = $1 * $3; }
	| op_int T_DIVIDE op_float	 { $$ = $1 / $3; }
	| op_float T_PLUS op_int	 	 { $$ = $1 + $3; }
	| op_float T_MINUS op_int	 	 { $$ = $1 - $3; }
	| op_float T_MULTIPLY op_int 	 { $$ = $1 * $3; }
	| op_float T_DIVIDE op_int	 { $$ = $1 / $3; }
	| op_int T_DIVIDE op_int		 { $$ = $1 / (float)$3; }
;

op_int
	: T_INT				{ $$ = $1; }
	| op_int T_PLUS op_int	{ $$ = $1 + $3; }
	| op_int T_MINUS op_int	{ $$ = $1 - $3; }
	| op_int T_MULTIPLY op_int	{ $$ = $1 * $3; }
	| T_LPARENTHESIS op_int T_RPARENTHESIS		{ $$ = $2; }
;

%%

int main() {
	yyin = stdin;

	do {
		yyparse();
	} while(!feof(yyin));

	return 0;
}

void yyerror(const char* s) {
	fprintf(stderr, "Parse error: %s\n", s);
	exit(1);
}
