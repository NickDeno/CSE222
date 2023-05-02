#include <stdio.h>

//Dynamic Memory Allocation
int main(void) {
	//sizeof function. Tells the number of bytes needed to save certain type of value. For example, sizeof(int)
	//will return 4


	//Gives us int pointer that points to memory block of 20 bytes. Will allow us to store 5 int numbers
	int* p = (int*)malloc(5 * sizeof(int));
	free(p);

	//Functions the same as malloc but takes in 2 parameters, data type and size of memory block. it will multiply these values
	int* p1 = (int*)calloc(5, sizeof(int));
	//Will change the size of memory block to 5 to 6. Can also reduce the size of memory block without memory leak, however
	p1 = (int*)realloc(p1, sizeof(int) * 6);
	free(p1);


	return 0;
}