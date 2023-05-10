#include <stdlib.h>;
#include "BSTType.h"
#include <stdio.h>

int main(void) {
    //Inserting into Tree
	struct Node* root = NULL;
    root = insertNode(root, 5);
    root = insertNode(root, 3);
    root = insertNode(root, 2);
    root = insertNode(root, 4);
    root = insertNode(root, 7);
    root = insertNode(root, 6);
    root = insertNode(root, 8);

    //Searching Tree
    int key = 7;
    printf("A node with the value %d %s in the tree\n", key, findNode(root, key) ? "was found" : "was not found");

    //Deleting Node in Tree
    root = deleteNode(root, 7);

    //Searching Tree for Deleted Node
    printf("A node with the value %d %s in the tree\n", key, findNode(root, key) ? "was found" : "was not found");

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
    deleteTree(&root);
    inOrderTraversal(root);
    if (root == NULL) {
        printf("\nBinary Tree was sucessfully deleted");
    }

	return 0;
}