%{
#include <stdio.h>
#include <stdlib.h>

int yylex(void);
void yyerror(const char *s);
%}

%token ID NUM

%%
input :
      | input expr end    { printf("Valid expression\n"); }
      ;

end : '\n'
    | /* empty */  /* handle EOF gracefully */
    ;

expr  : term
      | expr '+' term
      | expr '-' term
      ;

term  : factor
      | term '*' factor
      | term '/' factor
      ;

factor: ID
      | NUM
      | '(' expr ')'
      ;
%%

void yyerror(const char *s) {
    printf("Invalid expression\n");
}

int main() {
    printf("Enter arithmetic expressions (Ctrl+D or Ctrl+Z to end):\n");
    yyparse();
    return 0;
}
