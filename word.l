%{
#include <stdio.h>
#include <string.h>

char longest[1024];   // store longest word
%}

%%

[A-Za-z]+   {
                if (strlen(yytext) > strlen(longest)) {
                    strcpy(longest, yytext);
                }
            }

.|\n        { /* ignore non-letters */ }

%%

int main(int argc, char *argv[])
{
    longest[0] = '\0';   // initialize empty

    printf("Enter text (Ctrl+Z then Enter to stop on Windows, Ctrl+D on Linux):\n");

    yylex();   // process input

    if (strlen(longest) > 0)
        printf("Longest word: %s (length: %zu)\n", longest, strlen(longest));
    else
        printf("No words found.\n");

    return 0;
}

int yywrap()
{
    return 1;
}
