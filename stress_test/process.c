#include<unistd.h>
#include<sys/types.h>

main()
{
    while(1)
        fork();
    return(0);
}

/* gcc -o process process.c */
