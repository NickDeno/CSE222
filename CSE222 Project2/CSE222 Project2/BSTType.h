#pragma once
#include <stdbool.h>

struct Node {
	int key;
	struct Node* leftChild;
	struct Node* rightChild;
};

extern struct Node* createNode(int value);
extern struct Node* insertNode(struct Node* node, int value);
extern bool findNode(struct Node* node, int value);
extern struct Node* deleteNode(struct Node* node, int value);
extern void inOrderTraversal(struct Node* node);
extern void preOrderTraversal(struct Node* node);
extern void postOrderTraversal(struct Node* node);
extern void deleteTree(struct Node* node);
