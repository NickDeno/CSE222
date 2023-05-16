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

//Copy Instructor. Creates deep copy
MyClass::MyClass(const MyClass& cls) {
	x = cls.x;
	y = cls.y;
	p = new int;
	*p = *(cls.p);

}

MyClass::~MyClass() {
	if (p != nullptr) {
		delete p;
	}
}

MyClass MyClass::operator+(const MyClass& cls) {
	MyClass cls1;
	cls1.x = x + cls.x;
	cls1.y = y + cls1.y;
	*cls1.p = *(this->p) + *(cls.p);
	return cls1;
}

MyClass& MyClass::operator=(const MyClass& cls) {
	x = cls.x;
	y = cls.y;
	*p = *(cls.p);
	return *this;
}

//Pre increment(++x)
MyClass& MyClass::operator++() {
	++x;
	++y;
	*p = *p + 1;
	return *this;
}

//Post increment(x++). Create new object containing values from original object. Then increment valuses in 
//original object. Return new object.
MyClass MyClass::operator++(int) {
	MyClass temp;
	temp.x = x;
	temp.y = y;
	*(temp.p) = *p;
	x++;
	y++;
	*p = *p + 1;
	return temp;

	//We cannot return pointer of temp, since temp object will be destroyed after function returns.
	//This means the return of this function would return a pointer that points to a object that doesnt exisit
	//return &temp
}

std::ostream& operator<<(const std::ostream& out, MyClass cls) {
	std::cout << "MyClass(" << cls.x << ", " << cls.y << ")" << std::endl;
	return std::cout;
}

int MyClass::sum() {
	return x + y;
}