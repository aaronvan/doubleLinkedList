#include <stdio.h>
#include <stdlib.h>
#include <assert.h>
#include "list.c"

int main(int argc, char *argv[]) {
    LIST *list = listCreate();
	
	addNode(88, list);
	addNode(429, list);
	addNode(200, list);
	addNode(4, list);
	addNode(200, list);
	addNode(9042, list);
	printList(list);


    return EXIT_SUCCESS;
}
