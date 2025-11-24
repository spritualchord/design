%{
#include <stdio.h>
#include <stdlib.h>

int char_count = 0;
int line_count = 0;
FILE *yyin;   // input file pointer for flex
%}

%%

\n      { line_count++; char_count++; }   // count newline as character
.       { char_count++; }                 // count any other character

%%

int main(int argc, char *argv[])
{
    if (argc < 2) {
        printf("Usage: %s <filename>\n", argv[0]);
        exit(1);
    }

    yyin = fopen(argv[1], "r");
    if (!yyin) {
        perror("Error opening file");
        exit(1);
    }

    yylex();

    printf("Number of lines: %d\n", line_count);
    printf("Number of characters: %d\n", char_count);

    fclose(yyin);
    return 0;
}

int yywrap() {
    return 1;
}
