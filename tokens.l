%{
#include "parser.tab.h"
%}

%%
RECEBA { return RECEBA; }
DEVOLVA { return DEVOLVA; }
[a-zA-Z]+ { yylval.sval = strdup(yytext); return ID; }
%%
