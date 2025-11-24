%{
#include <stdio.h>
#include <stdlib.h>

int yylex(void);
void yyerror(const char *s);
%}

%token A B

%%
input :
      | input line
      ;

line  : '\n'
      | S '\n' { printf("Valid string of form a^n b^n\n"); }
      ;

S : A B
  | A S B
  ;
%%

void yyerror(const char *s) {
    printf("Invalid string\n");
}

int main() {
    printf("Enter strings (Ctrl+D or Ctrl+Z to quit):\n");
    yyparse();
    return 0;
}
