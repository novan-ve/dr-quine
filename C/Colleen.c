#include <stdio.h>
/*
  This program will print its own source when run.
*/
int get_zero(){return(0);}
int main(){
/*
  This program will print its own source when run.
*/
char*s="#include <stdio.h>%c/*%c  This program will print its own source when run.%c*/%cint get_zero(){return(0);}%cint main(){%c/*%c  This program will print its own source when run.%c*/%cchar*s=%c%s%c;%cprintf(s,10,10,10,10,10,10,10,10,10,34,s,34,10,10);return(get_zero());}%c";
printf(s,10,10,10,10,10,10,10,10,10,34,s,34,10,10);return(get_zero());}
