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
SE { return SE; }
ENTAO { return ENTAO; }
FIMSE { return FIMSE; }
SENAO { return SENAO; }
ENQUANTO { return ENQUANTO; }
FACA { return FACA; }
FIMENQUANTO { return FIMENQUANTO; }
\+ { return ADD; }
\- { return SUB; }
\* { return MUL; }
\/ { return DIV; }
, { return VIRG; }
= { return EQUAL; }
== { return COMPARE; }
[a-zA-Z]+ { yylval.sval = strdup(yytext); return ID; }
[0-9]+ { yylval.sval = strdup(yytext); return INT; }

%%
