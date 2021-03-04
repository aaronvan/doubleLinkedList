/* list.c */

#include <stdio.h>
#include "list.h"

/*
* listCreate
* Purpose: start a list
* Args: void
* Return: point of type LIST
*/
LIST *listCreate(void) {
	return calloc(1, sizeof(LIST));
}

/*
* addNode
* Purpose: add a node to the list
* Args: integer data, list
* Return: void
*/
void addNode(void *data, LIST *list) {
    LISTITEM *node = (LISTITEM *)calloc(1, sizeof(LISTITEM));
	assert(node != NULL);
	node->data = data;
	
	if (list->last == NULL) {
		list->first = node;
		list->last = node;
		node->prev = (LISTITEM *)&list;
	} else {
		list->last->next = node;
		node->prev = list->last;
		list->last = node;
	}
	list->count++;
}

/*
* clearList
* Purpose: clears the value in each record but not the record itself
* Args: pointer to LIST
* Return: void
*/
void clearList(LIST *list) {
	FOREACH(list, first, next, temp) {
		free(temp->data);
	}
}

/*
 * printList
 * Purpose: print the data fields of each list element
 * Args: pointer to list
 * Return: void
 */
void printList(LIST *list) {
	FOREACH(list, first, next, temp) {
		printf("address: %p\tdata: %d\n", temp, temp->data);
	}
}