%{
#include "var.tab.h"
%}

digit   [0-9]
letter  [a-z]
var     {letter}{digit}

%%
{var}           { return VALID; }
[a-zA-Z0-9]+    { return INVALID; }
[ \t\r]         ;
\n              { return '\n'; }
.               { return INVALID; }
%%

int yywrap() { return 1; }