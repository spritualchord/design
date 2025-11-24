%{
#include <stdio.h>
#include <stdlib.h>

int yylex();
void yyerror(const char *s);
%}

%token VALID INVALID

%%
input:
      /* empty */
    | input line
    ;

line:
      VALID '\n'     { printf("Valid variable name\n"); }
    | INVALID '\n'   { printf("Invalid variable name\n"); }
    ;
%%

void yyerror(const char *s)
{
    printf("Error while parsing input\n");
}

int main()
{
    printf("Enter variable names (Ctrl+Z to end):\n");
    yyparse();
    return 0;
}
