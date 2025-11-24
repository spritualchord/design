%{
#include <stdio.h>
int char_count = 0;
int line_count = 0;
%}

%%

\n      { line_count++; char_count++; }   // count newline as a character
.       { char_count++; }                 // count any other character

%%

int main(int argc, char *argv[])
{
    // Run lexer
    yylex();

    printf("Number of lines: %d\n", line_count);
    printf("Number of characters: %d\n", char_count);

    return 0;
}

int yywrap() {
    return 1;
}
