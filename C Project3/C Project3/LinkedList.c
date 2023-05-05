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
	//Case 2: 
	else if (value < list->key) {
		node->next = list;
		return node;
	}

	//Case 3:
	struct Node* ptr = NULL;
	while (ptr->next != NULL) {
		struct Node* ptr1 = ptr->next;
		if (ptr->key < value) {
			ptr = ptr1;
		}
		else {
			node->next = ptr1;
			ptr->next = node;
			return list;
		}
	}
	ptr->next = node;
	return list;
}

struct Node* deleteNode(struct Node* list, int value) {
	if (list == NULL) {
		return list;
	}
	struct Node* currNode = list;
	struct Node* previousNode = NULL;
	while (currNode != NULL) {
		if (currNode->key == value) {
			if (currNode->next == NULL) {
				previousNode->next = NULL;
			}
			else {
				currNode = currNode->next;
			}
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

void display(struct Node* list) {
	struct Node* currNode = list;
	while (currNode != NULL) {
		printf("%d\n", currNode->key);
		currNode = currNode->next;
	}
}

void deleteList(struct Node* list) {
	struct Node* currNode = list;
	struct Node* nextNode = NULL;
		while (currNode->next != NULL) {
			nextNode = currNode->next;
			free(currNode);
			currNode = nextNode;
		}
		free(currNode);
}

