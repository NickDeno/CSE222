#include <stdio.h>
#include "LinkedListType.h"

int main(void) {
	struct Node* list = NULL;
	list = addNode(list, 6);
	list = addNode(list, 3);
	list = addNode(list, 8);
	list = addNode(list, 2);
	list = addNode(list, 4);
	list = addNode(list, 4);
	list = addNode(list, 9);

	displayList(list);
	list = deleteNode(list, 2);
	list = deleteNode(list, 4);
	displayList(list);

	deleteList(&list);
	displayList(list);

}
