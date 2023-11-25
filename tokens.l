%{
#include "parser.tab.h"
%}

%%
RECEBA { return RECEBA; }
DEVOLVA { return DEVOLVA; }
HORADOSHOW { return HORADOSHOW; }
AQUIACABOU { return AQUIACABOU; }
\+ { return ADD; }
, { return VIRG; }
= { return EQUAL; }
[a-zA-Z]+ { yylval.sval = strdup(yytext); return ID; }
%%
