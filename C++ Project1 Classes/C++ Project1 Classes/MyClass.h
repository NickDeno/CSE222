#pragma once
//Define data types and define functions in header file
class MyClass
{
private:
	int x;
	int y;
	int* p;

public:
	int z;
	int w;

	MyClass();
	MyClass(int, int, int c);
	~MyClass();


	int sum();
};

