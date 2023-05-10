#pragma once

struct MyStruct {
	int v1;
	float v2;
	char* ptr1;
};

extern int add(int x, int y);
extern int sub(int x, int y);
extern int demoFunctionPointer(int x, int y, int(*func_ptr)(int, int));