%{
#include <stdio.h>
#include <stdlib.h>

// Function to report a valid token
void report_token(const char* token_type, const char* yytext) {
    printf("%s: %s\n", token_type, yytext);
}
%}

%%
[0-9]+              { report_token("NUMBER", yytext); }
[ \t\n]+            ;  // Ignore whitespace
"("                 { report_token("LPAREN", yytext); }
")"                 { report_token("RPAREN", yytext); }
"+"                 { report_token("PLUS", yytext); }
"-"                 { report_token("MINUS", yytext); }
"*"                 { report_token("MULTIPLY", yytext); }
"/"                 { report_token("DIVIDE", yytext); }
.                   { printf("Invalid character: %s\n", yytext); exit(1); }
%%

int main(int argc, char **argv) {
    printf("Enter an arithmetic expression:\n");
    yylex();
    printf("Expression is valid.\n");
    return 0;
}

int yywrap(){
	return 1;
}