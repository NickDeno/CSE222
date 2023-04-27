#include <stdio.h>
#include "Funcs.h"

int main(void) {
	int x = 25;
	int y = 50;
	int z = 75;

	mySwapFunction(x, y);
	
	int test = MY_CONST1;
	printf("Constant value: %d\n", test);

	printf("The greatest number between %d, %d, and %d is %d", x, y, z, findGreatest(x, y, z));

	//Defining array
	int arr[5];
	

	return 0;
}
