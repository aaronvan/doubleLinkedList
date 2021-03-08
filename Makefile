CC		= gcc
BINDIR	= bin
OBJDIR	= obj
MKDIR	= mkdir -pv
RM		= rm -rfv
CFLAGS	= -Wall -Iinclude -std=c17 -pedantic -Werror -DNDEBUG

OBJECTS = list.o main.o

# executable
_BIN = a.out
BIN = $(addprefix $(BINDIR)/, $(_BIN))

# linking
$(BIN): $(OBJECTS) $(BINDIR)
	$(CC) $(OBJECTS) -o $@

$(BINDIR):
	$(MKDIR) $(BINDIR)

.PHONY: clean
clean:
	@echo Cleaning up...
	$(RM) $(BINDIR)