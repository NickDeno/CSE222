#include <stdlib.h>
#include "LinkedListType.h"
#include <stdio.h>

struct Node* createNode(int value) {
	struct Node* node = (struct Node*)malloc(sizeof(struct Node));
	node->key = value;
	node->next = NULL;
	return node;
}

struct Node* addNode(struct Node* list, int value) {
	struct Node* node = createNode(value);
	//Case 1: List hasn't been created
	if (list == NULL) {
		return node;
	}
	//Case 2: New Node will become "Head node"(list)
	else if (value < list->key) {
		node->next = list;
		return node;
	}

	//Case 3: Search rest of list to find where to insert new node
	struct Node* currNode = list;
	while (currNode->next != NULL) {
		struct Node* nextNode = currNode->next;
		if (nextNode->key > value) {
			node->next = nextNode;
			currNode->next = node;
			return list;
		}
		else {
			currNode = nextNode;
		}
	}
	currNode->next = node;
	return list;
}

struct Node* deleteNode(struct Node* list, int value) {
	//Case 1: Empty list
	if (list == NULL) {
		return NULL;
	}
	//Case 2: Head node(list) == value to be deleted
	else if (list->key == value) {
		struct Node* tempNode = list;
		list = list->next;
		free(tempNode);
	}

	//Case 3: List is not empty and head node is != value to be deleted. Search rest of list
	struct Node* currNode = list;
	struct Node* previousNode = list;
	while (currNode != NULL) {
		if (currNode->key == value) {
			previousNode->next = currNode->next;
			free(currNode);
			currNode = previousNode->next;
		}
		else {
			previousNode = currNode;
			currNode = currNode->next;
		}
	}
	return list;
}

bool findKey(struct Node* list, int value) {
	struct Node* currNode = list;
	while (currNode != NULL) {
		if (currNode->key == value) {
			return true;
		}
		currNode = currNode->next;
	}
	return false;
}

void displayList(struct Node* list) {
	struct Node* currNode = list;
	printf("[");
	while (currNode != NULL) {
		printf("%d, ", currNode->key);
		currNode = currNode->next;
	}
	printf("]\n");
}

void deleteList(struct Node** pList) {
	struct Node* ptr = *pList;
	while (ptr->next != NULL) {
		struct Node* ptr1 = ptr->next;
		free(ptr);
		ptr = ptr1;
	}
	free(ptr);
	*pList = NULL;
}

