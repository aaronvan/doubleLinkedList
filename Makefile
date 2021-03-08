CC		= gcc
SDIR	= src
#BDIR	= bin
ODIR	= obj
MKDIR	= mkdir -pv
RM		= rm -rfv
INC		= -Iinclude
CFLAGS	= -Wall
#SRC	= $(wildcard $(SRCDIR)/*.c)
_OBJS	= list.o main.o
OBJS	= $(patsubst %, $(ODIR)/%, $(_OBJS))

# compiling
$(ODIR)/%.o: $(SDIR)/%.c
	$(CC) -c $(INC) -o $@ $< $(CFLAGS)

# linking
a.out: $(OBJS)
	$(CC) $(OBJS) -o $@

.PHONY: clean
clean:
	@echo Cleaning up...
	$(RM) $(ODIR)/*.o a.out