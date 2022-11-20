#include <stdio.h>
#define FT(x)int main(){int r=0; FILE *f=fopen("Grace_kid.c", "w+");if (!f) return(1); r=fputs("#include <stdio.h>\n#define FT(x)"x"\n#define S(s)#s\n#define X(s)S(s)\nFT(X(FT(x)))\n/*\n  This program will print its own source when run.\n*/\n", f); return(fclose(f)<0 || r<0 ? 1 : 0);}
#define S(s)#s
#define X(s)S(s)
FT(X(FT(x)))
/*
  This program will print its own source when run.
*/
