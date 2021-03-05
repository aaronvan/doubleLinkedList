CC		= gcc
SRCDIR	= src
BINDIR	= bin
MKDIR	= mkdir -pv
RM		= rm -rfv

CFLAGS = -Wall -g -std=c17 -pedantic -Iinclude

# executable
_BIN = a.out
BIN = $(addprefix $(BINDIR)/, $(_BIN))

.PHONY: all
all:
	$(MKDIR) $(BINDIR)
	$(CC) $(CFLAGS) $(SRCDIR)/main.c -o $(BIN)
	
.PHONY: clean
clean:
	@echo "Cleaning up..."
	$(RM) $(BINDIR)
