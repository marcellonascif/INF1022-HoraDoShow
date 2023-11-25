bison -d parser.y
flex tokens.l
gcc -c parser.tab.c lex.yy.c 
gcc -o compilador lex.yy.o parser.tab.o
./compilador input.txt output.c