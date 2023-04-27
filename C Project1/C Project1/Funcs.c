#include <stdio.h>
void mySwapFunction(int x, int y) {
	printf("Orignal x value: %d\n", x);
	printf("Orignal y value: %d\n", y);
	int temp = x;
	x = y;
	y = temp;
	printf("New x value: %d\n", x);
	printf("New y value: %d\n", y);
}

int findGreatest(int x, int y, int z) {
	int temp1 = (x > y) ? x : y;
	int temp2 = (z > temp1) ? z : temp1;
	return temp2;
}