#include <iostream>
#include "MyClass.h"

void swap1(int *x, int *y);
void swap2(int& x, int& y);
void demoFunc(MyClass cls);

int main(void) {
	int a = 123;
	int b = 321;
	swap1(&a, &b);
	swap2(a, b);

	std::cout << "Hello C++" << std::endl;
	int x;
	std::cin >> x;

	//Same as doing MyClass cls = new MyClass() in Java
	MyClass cls;
	
	demoFunc(cls);

	//Same as doing MyClass cls; in Java => pointer
	MyClass* pCls = nullptr;

	//If we wrote code this way, there would be memory leak since first object created
	//wouldnt be deleted
	//pCls = new MyClass(10, 20);
	//pCls = new MyClass(30, 60);

	//Instead we write code this way
	pCls = new MyClass(10, 20, 30);
	delete pCls;
	pCls = new MyClass(30, 60, 90);

	return 0;
}

void demoFunc(MyClass cls) {

}

//Pointer in C++ example. Swaps values using pointers, and actually changes original values of x and y
void swap1(int *x, int *y) {
	int temp = *x;
	*x = *y;
	*y = temp;
}

//Reference in C++ example. Swaps values without pointers, and actually changes original values of x and y
void swap2(int& x, int& y) {
	int temp = x;
	x = y;
	y = temp;
}