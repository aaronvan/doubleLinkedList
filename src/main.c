#include <stdio.h>
#include <stdlib.h>
#include <errno.h>
#include <string.h>
#include "list.h"

int main(int argc, char *argv[]) {
	if (argc != 2) {
		puts("Must enter a number.");
		return EXIT_FAILURE;
	}
	
	char buff[1024];
	long num;
	strncpy(buff, argv[1], 1024);
	char *endptr;
	
	errno = 0;
	num = strtol(buff, &endptr, 10);
	if (errno == ERANGE) {
		perror("Bad number");
		return EXIT_FAILURE;
	} else if (endptr == buff || argc != 2) {
		puts("Nothing read.");
		return EXIT_FAILURE;
	} else if (*endptr && *endptr != '\n') {
		puts("Did not get entire input.");
		return EXIT_FAILURE;
	}
	
    LIST *records = listCreate();
    for (int i = 0; i <= num; i++) {
		addNode(i, records);
	}
	printList(records);
	printf("Count: %d\n", List_count(records));
		
    return EXIT_SUCCESS;
}
