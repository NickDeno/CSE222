#include <stdlib.h>;
#include "BSTType.h"
#include <stdio.h>

int main(void) {
    //Inserting into Tree
	struct Node* root = NULL;
    root = insertNode(root, 50);
    root = insertNode(root, 30);
    root = insertNode(root, 20);
    root = insertNode(root, 40);
    root = insertNode(root, 70);
    root = insertNode(root, 60);
    root = insertNode(root, 80);
    root = insertNode(root, 75);

    //Searching Tree
    int key = 8;
    int key1 = 20;
    printf("A node with the value %d %s in the tree\n", key, findNode(root, key) ? "was found" : "was not found");
    printf("A node with the value %d %s in the tree\n", key1, findNode(root, key1) ? "was found" : "was not found");

    //Deleting Node in Tree
    root = deleteNode(root, 70);

    //Traversing Tree
    printf("inOrder traversal: ");
    inOrderTraversal(root);
    printf("\n");
    printf("preOrder traversal: ");
    preOrderTraversal(root);
    printf("\n");
    printf("postOrder traversal: ");
    postOrderTraversal(root);

    //Deleting Entire Tree
    deleteTree(root);

	return 0;
}