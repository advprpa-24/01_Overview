#include <stdio.h>
int main()
{
    int n, sum = 0;
    for (n = 10; n > 0; n--)
    {
        sum = sum + n;
    }
    printf("Result: %d\n", sum);
}

// cc sum.c
// ./a.out
