%{
#include "parser.tab.h"
%}

%%
RECEBA { return RECEBA; }
DEVOLVA { return DEVOLVA; }
HORADOSHOW { return HORADOSHOW; }
AQUIACABOU { return AQUIACABOU; }
EXECUTE { return EXECUTE; }
VEZES { return VEZES; }
FIMEXE { return FIMEXE; }
\+ { return ADD; }
, { return VIRG; }
= { return EQUAL; }
[a-zA-Z]+ { yylval.sval = strdup(yytext); return ID; }
[0-9]+ { yylval.sval = strdup(yytext); return INT; }

%%
