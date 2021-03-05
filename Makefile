CC		= gcc
SRCDIR	= src
BINDIR	= bin
MKDIR	= mkdir -pv
RM		= rm -rfv
VERIFY	= cat -e -t -v Makefile
CFLAGS = -Wall -g -std=c17 -pedantic -Iinclude -Werror -DNDEBUG

# executable
_EXE = a.out
# expand to: bin/a.out
BIN = $(addprefix $(BINDIR)/,$(_EXE))

# default recipe
.PHONY: all
all:
	$(MKDIR) $(BINDIR)
	$(CC) $(CFLAGS) $(SRCDIR)/main.c -o $(BIN)
	
.PHONY: clean
clean:
	@echo "Cleaning up..."
	$(RM) $(BINDIR)

.PHONY: verify
verify:
	$(VERIFY)

print-%:
	@echo $* = $($*)
