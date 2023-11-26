%{
#include "stdio.h"
#include "stdlib.h"
#include "string.h"

int yylex();
int yyerror(char *s);
extern int yyparse();
extern FILE *yyin;
FILE *output;
%}

%union {
  int ival;
  char *sval;
}

%token <sval> INT
%token <sval> ID
%token RECEBA DEVOLVA VIRG EQUAL ADD SUB MUL DIV 
%token HORADOSHOW
%token AQUIACABOU
%token EXECUTE
%token VEZES
%token FIMEXE
%token SE 
%token ENTAO
%token FIMSE
%token SENAO


%type <sval> program 
%type <sval> varlist
%type <sval> cmd
%type <sval> cmds


%%

program : RECEBA varlist DEVOLVA varlist HORADOSHOW cmds AQUIACABOU {
    char *vl1 = $2;
    char *vl2 = $4;

    vl1 = strtok(vl1," ");


    fprintf(output,"#include <stdio.h>\n"
                   "int main(void){\n");



    while(vl1 != NULL){ 
        fprintf(output,"int %s;\n",vl1);
 

        vl1 = strtok(NULL, " ");
    }
    
    fprintf(output,"int %s;\n",$4);

    fprintf(output,"%s\n",$6);

    fprintf(output,"return %s;\n}",vl2);
    free($4);
};

varlist : varlist VIRG ID {
    char *buf = $1;
    size_t id_len = strlen($3);
    size_t varlist_len = strlen(buf);
    size_t new_len = id_len + varlist_len + 2;
    char *buf2 = realloc(buf,new_len);
    strcat(buf2," ");
    
    $$ = strcat(buf2,$3);
    free($3);
} | ID {
    $$ = $1; // Assigning the semantic value for varlist

};

cmds: | cmds cmd {
    char *buf = malloc(strlen($1) + 2 + strlen($2));
    strcat(buf,$1);
    strcat(buf, "");
    $$ = strcat(buf,$2);
    free($1);
    free($2);
}
| cmd {
    $$ = $1;
};

cmd : |
ID EQUAL ID {
    char *buf = malloc(strlen($1) + 3 + strlen($3)+3);
    strcat(buf,$1);
    strcat(buf, " = ");
    strcat(buf,$3);
    $$ = strcat(buf,";\n");
    free($1);
    free($3);
}
| ID EQUAL INT {
    char *buf = malloc(strlen($1) + 3 + strlen($3)+1+3);
    strcat(buf,$1);
    strcat(buf, " = ");
    strcat(buf,$3);
    $$ = strcat(buf,";\n");
    free($1);
    free($3);
}
| ID EQUAL ID ADD ID {
    char *buf = malloc(strlen($1) + 3 + strlen($3) + 3 + strlen($5)+3);
    strcat(buf,$1);
    strcat(buf, " = ");
    strcat(buf,$3);
    strcat(buf," + ");
    strcat(buf,$5);
    
    $$ = strcat(buf,";\n");
    free($1);
    free($3);
    free($5);
}
| ID EQUAL ID ADD INT {
    char *buf = malloc(strlen($1) + 3 + strlen($3) + 3 + strlen($5)+3);
    strcat(buf,$1); 
    strcat(buf, " = ");
    strcat(buf,$3);
    strcat(buf," + ");
    strcat(buf,$5);

    $$ = strcat(buf,";\n");
    free($1);
    free($3);
    free($5);
}
| ID EQUAL ID SUB ID {
    char *buf = malloc(strlen($1) + 3 + strlen($3) + 3 + strlen($5)+3);
    strcat(buf,$1);
    strcat(buf, " = ");
    strcat(buf,$3);
    strcat(buf," - ");
    strcat(buf,$5);
    
    $$ = strcat(buf,";\n");
    free($1);
    free($3);
    free($5);
}
| ID EQUAL ID SUB INT {
    char *buf = malloc(strlen($1) + 3 + strlen($3) + 3 + strlen($5)+3);
    strcat(buf,$1); 
    strcat(buf, " = ");
    strcat(buf,$3);
    strcat(buf," - ");
    strcat(buf,$5);

    $$ = strcat(buf,";\n");
    free($1);
    free($3);
    free($5);
}
| ID EQUAL ID MUL ID {
    char *buf = malloc(strlen($1) + 3 + strlen($3) + 3 + strlen($5)+3);
    strcat(buf,$1);
    strcat(buf, " = ");
    strcat(buf,$3);
    strcat(buf," * ");
    strcat(buf,$5);
    
    $$ = strcat(buf,";\n");
    free($1);
    free($3);
    free($5);
}
| ID EQUAL ID MUL INT {
    char *buf = malloc(strlen($1) + 3 + strlen($3) + 3 + strlen($5)+3);
    strcat(buf,$1); 
    strcat(buf, " = ");
    strcat(buf,$3);
    strcat(buf," * ");
    strcat(buf,$5);

    $$ = strcat(buf,";\n");
    free($1);
    free($3);
    free($5);
} 
| ID EQUAL ID DIV ID {
    char *buf = malloc(strlen($1) + 3 + strlen($3) + 3 + strlen($5)+3);
    strcat(buf,$1);
    strcat(buf, " = ");
    strcat(buf,$3);
    strcat(buf," / ");
    strcat(buf,$5);
    
    $$ = strcat(buf,";\n");
    free($1);
    free($3);
    free($5);
}
| ID EQUAL ID DIV INT {
    char *buf = malloc(strlen($1) + 3 + strlen($3) + 3 + strlen($5)+3);
    strcat(buf,$1); 
    strcat(buf, " = ");
    strcat(buf,$3);
    strcat(buf," / ");
    strcat(buf,$5);

    $$ = strcat(buf,";\n");
    free($1);
    free($3);
    free($5);
} 
| EXECUTE cmds VEZES ID FIMEXE {
    char *loop = malloc(100);
    sprintf(loop,"for(int i = 0; i < %s; i++){\n%s}",$4,$2);
    $$ = strcat(loop,"");
    free($2);
    free($4);
}
| EXECUTE cmds VEZES INT FIMEXE {
    char *loop = malloc(strlen($2)+50);
    sprintf(loop,"for(int i = 0; i < %s; i++){\n%s}",$4,$2);
    $$ = strcat(loop,"");
    free($2);
    free($4);
}
| SE ID ENTAO cmd SENAO cmd FIMSE {
    char *ifstat = malloc(strlen($2)+strlen($4)+strlen($6)+100);
    sprintf(ifstat,"if(%s){\n%s} else{\n%s}\n",$2,$4,$6);
    $$ = strcat(ifstat,"");
    free($2);
    free($4);
    free($6);
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
    FILE *input = fopen(argv[1],"r");
    if (!input) {
        printf("Error opening input file\n");
        return 1;
    }
    output = fopen(argv[2],"w");
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
    fclose(output);
    return 0;
}
