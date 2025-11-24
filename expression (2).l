%{
#include "expr.tab.h"
%}

%%
[a-zA-Z]  { return ID; }
[0-9]+    { return NUM; }
[\+\-\*/] { return yytext[0]; }
[ \t\n]   { /* ignore whitespace */ }
.         { return yytext[0]; }
%%

int yywrap() { return 1; }
