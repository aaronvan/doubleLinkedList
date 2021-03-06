#ifndef __LIST_H__
#define __LIST_H__

typedef struct listitem {
    struct listitem *next;
    struct listitem *prev;
    int data;
} LISTITEM;

typedef struct list {
	int count;
    struct listitem *first;
    struct listitem *last;
} LIST;

#define List_count(A) ((A)->count)

#define FOREACH(L, S, M, V) \
		LISTITEM *_node; \
		LISTITEM *V; \
for(V = _node = L->S; _node != NULL; V = _node = _node->M)

LIST *listCreate(void);
void addNode(int, LIST *);
void printList(LIST *);

#endif /* list.h */
