#include <stdio.h>
#include <stdlib.h>

int foo ( int arg1, int arg2, int arg3, int arg4, int arg5, int arg6, int arg7 )
{
    int array[] = {100,200,300,400,500,600,700};
    int sum = array[arg1]+ array[arg7];
    return sum;
}      /* -----  end of function foo  ----- */

 
int main ( int argc, char *argv[] )
{
    int i = 1;
    int j = foo(0,1,2, 3, 4, 5,6);
   fprintf(stdout, "i=%d,j=%d\n", i, j);
    return 0;
}              
