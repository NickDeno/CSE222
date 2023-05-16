#include "MyClass.h"
#include <iostream>;

int main(void) {
	MyClass cls1;
	MyClass cls2;
	MyClass cls3 = cls1 + cls2;

	++cls3;
	cls3++;

	std::cout << cls3 << std::endl;

	return 0;
}

