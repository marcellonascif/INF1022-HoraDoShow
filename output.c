#include <stdio.h>
int main(void){
int X;
int Y;
int Z;
if(X){
X = X + 1;
} else{
Y = Y + 1;
}
Z = Z + 1;
for(int i = 0; i < 3; i++){
Z = Z + 1;
Y = Y + 1;
X = 1;
}
return Z;
}