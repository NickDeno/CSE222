#include <stdio.h>
#include "DemoStruct.h"
#include "LinkedListType.h"
int main(void) {
	struct Node* list = NULL;
	list = addNode(list, 6);
	list = addNode(list, 3);
	list = addNode(list, 8);
	list = addNode(list, 2);
	list = addNode(list, 9);
	findKey(list, 8);


	//Structure is actually created, not just a reference like java
	//In C++, the same applies with objects
	struct MyStruct var1;
	var1.value = 100;
	var1.value2 = 99.99;

	//Does not actually create structure, just a reference. This is like java
	struct MyStruct* var2;
	//2 different ways to initialize var2
	var2 = &var1;
	var2 = (struct MyStruct*)malloc(sizeof(struct MyStruct));
}

/*
	float x = 100.0;
	printf("x=%f\n", x);
	float* ptr = &x;
	*ptr = 200.0;
	printf("x=%f\n", x);

	int arr[4] = { 1,3,5,7 };
	int* ptr1 = arr;
	*ptr1++ = 2; *ptr1++ = 4;  *ptr1++ = 6; *ptr1 = 8;
	ptr1 = arr;
	*/