%{
#include <stdio.h>
#include <stdlib.h>   // for exit()
#include <string.h>
%}

%%

int|float|double|char|if|else|while|for|return   { printf("Keyword: %s\n", yytext); }

[0-9]+\.[0-9]+         { printf("Float: %s\n", yytext); }

[0-9]+                 { printf("Integer: %s\n", yytext); }

[a-zA-Z_][a-zA-Z0-9_]* { printf("Identifier: %s\n", yytext); }

"=="|"!="|"<="|">="|"++"|"--"|"+"|"-"|"*"|"/"|"="|"<"|">"   { printf("Operator: %s\n", yytext); }

"//".*                 { printf("Comment: %s\n", yytext); }

"/*"([^*]|\*+[^*/])*\*"/"   { printf("Comment: %s\n", yytext); }

[ \t\n]+               { /* ignore whitespace */ }

.                      { printf("Unknown: %s\n", yytext); }

%%

int main(int argc, char *argv[]) {  // include argc and argv
    if (argc < 2) {
        printf("Usage: %s <filename>\n", argv[0]);
        exit(1);
    }

    yyin = fopen(argv[1], "r");  // no need to declare FILE *yyin
    if (!yyin) {
        perror("Error opening file");
        exit(1);
    }

    yylex();

    fclose(yyin);
    return 0;
}

int yywrap(){
    return 1;
}
