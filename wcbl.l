%{
#include <stdio.h>

int words = 0, chars = 0, blanks = 0, lines = 0;
%}

%%
" "      { blanks++; chars++; }
"\t"     { blanks++; chars++; }
"\n"     { lines++; chars++; }
[A-Za-z_][A-Za-z0-9_]*   { words++; chars += yyleng; } 
.        { chars++; }
%%

int main(int argc, char *argv[]) {
    if(argc > 1) {
        FILE *fp = fopen(argv[1], "r");
        if(!fp) {
            printf("Error: Cannot open file %s\n", argv[1]);
            return 1;
        }
        yyin = fp;
    }

    yylex();

    printf("Number of characters: %d\n", chars);
    printf("Number of words: %d\n", words);
    printf("Number of blank spaces: %d\n", blanks);
    printf("Number of lines: %d\n", lines);

    return 0;
}

int yywrap() {
    return 1;
}
