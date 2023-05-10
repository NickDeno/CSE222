#include <stdlib.h>
#include <stdio.h>
#include "BSTType.h"

struct Node* createNode(int value) {
	struct Node* node = (struct Node*)malloc(sizeof(struct Node));
	node->key = value;
	node->leftChild = NULL;
	node->rightChild = NULL;
}

struct Node* insertNode(struct Node* node, int value) {
	//Case 1: Tree is empty or we reached null leaf node of tree => Node is created and inserted here
	if (node == NULL) {
		return createNode(value);
	}
	//Case 2: Node to insert < current node => traverse to left child of current node
	else if (value < node->key) {
		node->leftChild = insertNode(node->leftChild, value);
	}
	//Case 3: Node to insert >= current node => traverse to right child of current node
	else {
		node->rightChild = insertNode(node->rightChild, value);
	}
	return node;
}

bool findNode(struct Node* node, int value) {
	//Case 1: Tree is empty or we reached null leaf node => node was not found, return false
	if (node == NULL) {
		return false;
	}
	//Case 2: Node being searched for = current node => node was found, return true;
	else if (value == node->key) {
		return true;
	}
	//Case 3: Node being searched for < current node, => traverse to left child of current node
	else if (value < node->key) {
		return findNode(node->leftChild, value);
	}
	//Case 3: Node being searched for > current node, => traverse to right child of current node
	else {
		return findNode(node->rightChild, value);
	}
}

struct Node* deleteNode(struct Node* node, int value) {
	//Case 1: Tree is empty or node to delete was not found
	if (node == NULL) return node;

	//Case 2: Node to delete is less then current node
	if (value < node->key) {
		node->leftChild = deleteNode(node->leftChild, value);
	}
	//Case 3: Node to delete is greater then current node
	else if (value > node->key) {
		node->rightChild = deleteNode(node->rightChild, value);
	}
	//Case 4: Node to delete is current node. Now determine if node has 0, 1, or 2 children. This will determine how we delete 
	//the current node
	else {
		//Case 4a: Node to delete has no children => replace node to delete with NULL
		if (node->leftChild == NULL && node->rightChild == NULL) {
			free(node);
			return NULL;
		}
		//Case 4b: Node to delete only has left child => replace node to delete with left child
		if (node->leftChild != NULL && node->rightChild == NULL) {
			struct Node* tempNode = node->leftChild;
			free(node);
			return tempNode;
		}
		//Case 4c: Node to delete only has right child => replace node to delete with right child
		else if (node->leftChild == NULL && node->rightChild != NULL) {
			struct Node* tempNode = node->rightChild;
			free(node);
			return tempNode;
		}
		//Case 4d: Node to delete has 2 children => inOrder successor(most left node in right subtree of node to delete)
		//will replace node to delete
		else {
			//Gets sucessor node
			struct Node* tempNode = node->rightChild;
			while (tempNode != NULL && tempNode->leftChild != NULL) {
				tempNode = tempNode->leftChild;
			}
			//Swaps values in node to be deleted and sucessor node
			node->key = tempNode->key;
			//Deletes sucessor node(Since it is now a "duplicate node")
			node->rightChild = deleteNode(node->rightChild, tempNode->key);
		}
	}
	return node;
}

void inOrderTraversal(struct Node* node) {
	//Base case for recursive call
	if (node == NULL) {
		return;
	}
	inOrderTraversal(node->leftChild);
	printf("%d, ", node->key);
	inOrderTraversal(node->rightChild);
}

void preOrderTraversal(struct Node* node) {
	// Base case for recursive call
	if (node == NULL) {
		return;
	}
	printf("%d, ", node->key);
	preOrderTraversal(node->leftChild);
	preOrderTraversal(node->rightChild);
}

void postOrderTraversal(struct Node* node) {
	// Base case for recursive call
	if (node == NULL) {
		return;
	}
	postOrderTraversal(node->leftChild);
	postOrderTraversal(node->rightChild);
	printf("%d, ", node->key);
}

//Double pointer of original root node is needed so we can actually modify the original pointer to NULL after freeing all the nodes.
//If we only used a single pointer, the original pointer outside the function would still point to the memory that has been freed, 
//causing issues like accessing invalid memory
void deleteTree(struct Node** pNode) {
	//Base case for recursive call
	struct Node* node = *pNode;
	if (node == NULL) {
		return;
	}
	deleteTree(&node->leftChild);
	deleteTree(&node->rightChild);
	free(node);
	*pNode = NULL;
}