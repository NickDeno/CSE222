#include "MyClass.h"

MyClass::MyClass() {
	x = 100;
	y = 200;
	p = new int;
	*p = 300;
}

MyClass::MyClass(int x, int y, int z) {
	this->x = x;
	this->y = y;
	p = new int;
	*p = z;
}

//Prevents memory leak. Since if we delete a MyClass obj while p still has a pointer pointing to another memory block,
//the other memory block wont be deleted as well. So we create this method to ensure p is null before MyClass obj is deleted.
MyClass::~MyClass() {
	if (p != nullptr) {
		delete p;
	}
}

int MyClass::sum() {
	return x + y;
}