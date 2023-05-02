#include <stdio.h>

//Dynamic Memory Allocation
int memoryDemo(void) {
	//Gives us int pointer that points to memory block of 20 bytes. Will allow us to store 5 int numbers
	int* ptr = (int*)malloc(5 * sizeof(int));
	free(ptr);

	//Functions the same as malloc but takes in 2 parameters, data type and size of memory block. it will multiply these values
	int* ptr1 = (int*)calloc(5, sizeof(int));
	//Will change the size of memory block to 5 to 6. Can also reduce the size of memory block without memory leak, however
	ptr1 = (int*)realloc(ptr1, sizeof(int) * 6);
	free(ptr1);

	return 0;
}