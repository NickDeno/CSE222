#pragma once
#include <iostream>
class MyClass
{
private:
	int x;
	int y;
	int* p;

public:
	int w;
	int z;

	MyClass();
	MyClass(int x, int y, int z);
	MyClass(const MyClass& cls);
	~MyClass();

	MyClass operator+(const MyClass& cls);
	MyClass& operator=(const MyClass& cls);

	MyClass& operator++();
	MyClass operator++(int);

	friend std::ostream& operator<<(const std::ostream& out, MyClass cls);



	int sum();
};
