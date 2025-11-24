%{
#include "ab10.tab.h"
%}

%%
a   { return A; }
b   { return B; }
\n  { return '\n'; }
[ \t] ;
.   { return yytext[0]; }
%%

int yywrap() { return 1; }
