%{
#include <stdio.h>
#include <ctype.h>

int vowels = 0;
int consonants = 0;
%}

%%

[aeiouAEIOU]    { vowels++; }                        // match vowels
[a-zA-Z]        { consonants++; }                    // match consonants
.|\n            { /* ignore other characters */ }    // ignore spaces, digits, symbols

%%

int main(int argc, char *argv[])
{
    printf("Enter a string:\n");
    yylex();   // run lexer

    printf("Number of vowels: %d\n", vowels);
    printf("Number of consonants: %d\n", consonants);

    return 0;
}

int yywrap()
{
    return 1;
}
