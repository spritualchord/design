%{
#include <stdio.h>
#include <ctype.h>

int shift;   // user-defined shift
%}

%%
[a-z]   { 
            char c = yytext[0];
            char e = ((c - 'a' + shift) % 26) + 'a';
            printf("%c", e);
        }
[A-Z]   { 
            char c = yytext[0];
            char e = ((c - 'A' + shift) % 26) + 'A';
            printf("%c", e);
        }
.|\n    { printf("%s", yytext); }  // print everything else unchanged
%%

int main() {
    printf("Enter shift value: ");
    scanf("%d", &shift);
    printf("Enter text: ");
    yylex();
    return 0;
}

int yywrap(){
	return 1;
}