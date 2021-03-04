#include <stdio.h>
#include <stdlib.h>
#include <assert.h>
#include "list.c"

int main(int argc, char *argv[]) {
    LIST *records = listCreate();
    for (size_t i = 0; i <= 3; i++) {
		addNode((int *)i, records);
	}
	printList(records);
	printf("Count: %d\n", List_count(records));
	clearList(records);
	
    return EXIT_SUCCESS;
}
