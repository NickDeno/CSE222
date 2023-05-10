#include "Demo.h"
#include <stdio.h>


int main(void) {
	int a = 0;
	int b = 0;

	scanf("%d", &a);
	scanf("%d", &b);

	//Function pointer with name f_math and 2 int parameters
	int(*f_math)(int, int);

	f_math = add;
	int result = f_math(a,b);
	f_math = sub;
	result = f_math(a, b);

	int result1 = demoFunctionPointer(a, b, add);
	result1 = demoFunctionPointer(a, b, sub);

	return 0;
}

//Takes in 2 ints, and a function pointer of a function that takes in 2 ints and returns an int
int demoFunctionPointer(int x, int y, int(*func_ptr)(int, int)) {
	return func_ptr(x, y);
}

int add(int x, int y) {
	return x + y;
}

int sub(int x, int y) {
	return x - y;
}

