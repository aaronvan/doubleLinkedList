#include <stdio.h>
#include <stdlib.h>
#include <errno.h>
#include "list.h"

int main(int argc, char *argv[]) {
	char buf[1024];
	long num;
	
	printf("How many nodes? ");
	if ( (fgets(buf, 1024, stdin) != NULL) ) {
		char *endptr;
		errno = 0;
		num = strtol(buf, &endptr, 10);
		if (errno == ERANGE) {
			printf("Number too small or too large\n");
			return EXIT_FAILURE;
		} else if (endptr == buf) {
			printf("Nothing read.\n");
			return EXIT_FAILURE;
		} else if (*endptr && *endptr != '\n') {
			printf("Failure to convert.\n");
			return EXIT_FAILURE;
		}
	}
	
    LIST *records = listCreate();
    for (int i = 0; i <= num; i++) {
		addNode(i, records);
	}
	printList(records);
	printf("Count: %d\n", List_count(records));
		
    return EXIT_SUCCESS;
}
