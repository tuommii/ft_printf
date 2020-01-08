
#include <stdio.h>
#include "inc/ft_printf.h"

int main(void)
{
	ft_printf("%10s, %.6s\n", "Hello", "World!!!!!!!!!!!!!!!");
	ft_printf("%10.2f\n", 45.67777);
	ft_printf("%x\n", 255);

	printf("%10s, %.6s\n", "Hello", "World!!!!!!!!!!!!!!!");
	printf("%10.2f\n", 45.67777);
	printf("%x\n", 255);
	return (0);
}
