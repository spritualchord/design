%{
#include <stdio.h>
#include <stdlib.h>

int yylex(void);
void yyerror(const char *s);
int count_a = 0, count_b = 0;
%}

%token A B

%%
input :
      | input line
      ;

line  : '\n'
      | S '\n' {
            if (count_a == count_b && count_a >= 10)
                printf("Valid: a^n b^n where n >= 10\n");
            else
                printf("Invalid string\n");
            count_a = count_b = 0;
        }
      ;

S : A { count_a++; } B { count_b++; }
  | A { count_a++; } S B { count_b++; }
  ;
%%

void yyerror(const char *s) {
    printf("Invalid string\n");
    count_a = count_b = 0;
}

int main() {
    printf("Enter strings (Ctrl+D or Ctrl+Z to quit):\n");
    yyparse();
    return 0;
}
