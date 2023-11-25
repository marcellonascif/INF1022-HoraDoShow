%{
#include "stdio.h"
#include "stdlib.h"
#include "string.h"

int yylex();
int yyerror(char *s);
extern int yyparse();
extern FILE *yyin;

%}

%union {
  char *sval;
}

%token <sval> ID
%token RECEBA DEVOLVA

%type <sval> program 
%type <sval> varlist

%%

program : RECEBA varlist DEVOLVA varlist {
    printf("Parsed.");
};

varlist : ID {
    printf("Variable: %s\n", $1);
    $$ = $1; // Assigning the semantic value for varlist
};

%%

int yyerror(char *s) {
    fprintf(stderr, "Syntax error: %s\n", s);
    return 0;
}

int yywrap() {
    // Return 1 to indicate the end of input
    return 1;
}

int main(int argc, char* argv[]){
    printf("STARTED\n");

    FILE *input = fopen(argv[1],"r");
    if (!input) {
        printf("Error opening input file\n");
        return 1;
    }

    yyin = input;
    int result = yyparse();  // Initiates the parsing process

    if (result == 0) {
        printf("Parsing successful\n");
    } else {
        printf("Parsing failed\n");
    }

    fclose(input);
    return 0;
}
