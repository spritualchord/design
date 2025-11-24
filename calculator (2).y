%{
#include <stdio.h>
#include <stdlib.h>

int yylex(void);
void yyerror(const char *s);
%}

%token NUMBER

%left '+' '-'
%left '*' '/'
%right UMINUS

%%
input :
      | input line
      ;

line  : '\n'
      | expr '\n'    { printf("Result = %d\n", $1); }
      ;

expr  : expr '+' expr   { $$ = $1 + $3; }
      | expr '-' expr   { $$ = $1 - $3; }
      | expr '*' expr   { $$ = $1 * $3; }
      | expr '/' expr   {
                            if ($3 == 0) {
                                printf("Error: Division by zero!\n");
                                $$ = 0;
                            } else {
                                $$ = $1 / $3;
                            }
                        }
      | '-' expr %prec UMINUS { $$ = -$2; }
      | '(' expr ')'    { $$ = $2; }
      | NUMBER          { $$ = $1; }
      ;
%%

void yyerror(const char *s) {
    printf("Invalid expression\n");
}

int main() {
    printf("Enter expressions (Ctrl+D or Ctrl+Z to quit):\n");
    yyparse();
    return 0;
}
