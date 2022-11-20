int i = 5;
#include <string.h>
#include <stdio.h>
#include <stdlib.h>
#define PF "Sully_%d.c"
#define CF "clang -Wall -Werror -Wextra Sully_%1$d.c -o Sully_%1$d; ./Sully_%1$d"
int O(char *s){return(strcmp(s, __FILE__));}
int F(char *s,int d) {return(sprintf(s, PF, d));}
int C(char *s) {return(sprintf(s, CF, i));}
#define FT(x)int main() {FILE *f;char b[96];int r = 0;if(i <= 0)return(0);if (F(b, i) < 0)return(1);if(!O(b) && F(b,--i) < 0)return(1);if(!(f = fopen(b, "w+")))return (1);r = fprintf(f, "int i = %d;\n#include <string.h>\n#include <stdio.h>\n#include <stdlib.h>\n#define PF \"Sully_%%d.c\"\n#define CF \"clang -Wall -Werror -Wextra Sully_%%1$d.c -o Sully_%%1$d; ./Sully_%%1$d\"\nint O(char *s){return(strcmp(s, __FILE__));}\nint F(char *s,int d) {return(sprintf(s, PF, d));}\nint C(char *s) {return(sprintf(s, CF, i));}\n#define FT(x)%s\n#define S(s)#s\n#define X(s)S(s)\nFT(X(FT(x)))\n", i, x);if (fclose(f) < 0 || r < 0 || C(b) < 0)return (1);return (system(b) < 0 ? 1 : 0);}
#define S(s)#s
#define X(s)S(s)
FT(X(FT(x)))
