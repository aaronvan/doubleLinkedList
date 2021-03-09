#include <stdio.h>
#include <stdlib.h>
#include "list.h"

int main(int argc, char *argv[]) {
    LIST *records = listCreate();
    for (int i = 0; i <= 3; i++) {
		addNode(i, records);
	}
	printList(records);
	printf("Count: %d\n", List_count(records));
		
    return EXIT_SUCCESS;
}
