#include <stdio.h>
#include <stdlib.h>


struct demo_s {
    char var8;
    int  var32;
    long var64;
};

struct demo_s foo (struct demo_s d)
{
    d.var8=8;
    d.var32=32;
    d.var64=64;
    return d;
}      /* -----  end of function foo  ----- */

int main ( int argc, char *argv[] )
{
   struct demo_s d, result;
   result = foo (d);
   fprintf(stdout, "demo: %d, %d, %ld\n", result.var8,result.var32, result.var64);
   return 0;
}
