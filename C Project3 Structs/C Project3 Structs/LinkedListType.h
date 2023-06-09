#pragma once
#include <stdbool.h>

struct Node {
	int key;
	struct Node* next;
};

extern struct Node* createNode(int value);
extern struct Node* addNode(struct Node* list, int value);
extern struct Node* deleteNode(struct Node* list, int value);
extern bool findKey(struct Node* list, int value);
extern void displayList(struct Node* list);
extern void deleteList(struct Node* list);

//Linked List will be sorted in ascending order. This will be done on insertion
