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
	int* p = &x;

	*p = 120;
	x += 300;

	swap(x, y);    //Will only swap values in x and y locally due to pass by values
	swap1(&x, &y); //Will actually swap values of orignal x and y

	//int a[5]; Same as in java doing int[] a = new int[5]
	int a[] = { 1,3,5,7,9 };
	int* p1 = a; //We can also write this as int* p1 = &(a[0]);

	for (int i = 0; i < 5; i++) {
		printf("a[%d]=%d\t", i, a[i]);
	}
	printf("\n");

	//Displaying arr elements using pointer
	for (int i = 0; i < 5; i++) {
		printf("a[%d]=%d\t", i, *p1);
		p1++;
	}
	printf("\n");

	//In this case, p1 will not be changed itself
	p1 = a;
	for (int i = 0; i < 5; i++) {
		printf("a[%d]=%d\t", i, *(p1+i));
	}
	printf("\n");

	float z = 99.90;
	void* p2; //No data type asserted to this pointer, Generic Pointer
	p2 = &z;
	printf("z=%f\n",*(float*)p2);

	int w = 300;
	p2 = &w; //Since p2 is generic pointer, we can store multiple types of data in it, not limited to one.
	printf("z=%d\n", *(int*)p2);

	int(*func_ptr)(int, int);
	func_ptr = add;
	int result = func_ptr(x, y);
	func_ptr = sub;
	result = func_ptr(x, y);

	int result1 = func_math(x, y, add);
	result1 = func_math(x, y, sub);


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

void swap(int x, int y) {
	int t = x;
	x = y;
	y = t;
}

void swap1(int* x, int* y) {
	int t = *x;
	*x = *y;
	*y = t;
}