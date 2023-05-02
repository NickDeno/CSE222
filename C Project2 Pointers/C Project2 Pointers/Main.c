#include <stdio.h>

extern void swap(int x, int y);
extern void swap1(int* x, int* y);
extern int add(int x, int y);
extern int sub(int x, int y);
int func_math(int x, int y, int(*func_ptr)(int, int));

//int main(int argc, char* argv[]) Another version of main method.Passes an array into function. To pass array
//into functions, we need the array and array length
int main(void) {
	int x = 100;
	int y = 200;
	int* xPtr = &x;
	*xPtr = 120;
	x += 300;
	swap(x, y);  
	swap1(&x, &y); 

	int a[] = { 1,3,5,7,9 };
	int* aPtr = a;
	//Case 1: Regular Display
	for (int i = 0; i < 5; i++) {
		printf("a[%d]=%d\t", i, a[i]);
	}
	printf("\n");

	//Case 2: Displaying elements using pointer
	for (int i = 0; i < 5; i++) {
		printf("a[%d]=%d\t", i, *aPtr);
		aPtr++;
	}
	printf("\n");

	//Case3: Value of aPtr will not be changed itself unlike Case2
	aPtr = a;
	for (int i = 0; i < 5; i++) {
		printf("a[%d]=%d\t", i, *(aPtr+i));
	}
	printf("\n");

	//Generic Pointers
	float z = 99.90;
	void* zPtr = &z;
	printf("z=%f\n",*(float*)zPtr);
	int w = 300;
	zPtr = &w; 
	printf("w=%d\n", *(int*)zPtr);

	//Function Pointers
	int result = func_math(x, y, add);
	result = func_math(x, y, sub);

	return 0;
}

//Function pointer allows us to pass a function within a function => functional programming.
int func_math(int x, int y, int(*func_ptr)(int, int)) {
	return func_ptr(x, y);
}

int add(int x, int y) {
	return x + y;
}

int sub(int x, int y) {
	return x - y;
}

//Will only swap values in x and y locally due to pass by values
void swap(int x, int y) {
	int t = x;
	x = y;
	y = t;
}

//Will actually swap values of orignal x and y since we are passing pointers of x and y into function
void swap1(int* x, int* y) {
	int t = *x;
	*x = *y;
	*y = t;
}