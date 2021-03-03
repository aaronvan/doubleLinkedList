#ifndef __LIST_H__
#define __LIST_H__

struct listitem {
    struct listitem *next;
    struct listitem *prev;
    int data;
};

struct list {
    struct listitem *first;
    struct listitem *last;
};

#endif /* list.h */
