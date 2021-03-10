CC      = gcc
BINDIR  = bin
OBJDIR  = obj
SRCDIR  = src
MKDIR   = mkdir -p
RM      = rm -rfv
VERIFY	= cat -e -t -v Makefile
SRC     = $(wildcard $(SRCDIR)/*.c)
OBJS   	= $(patsubst $(SRCDIR)/%.c, $(OBJDIR)/%.o, $(SRC))
CFLAGS  = -Wall -g -Iinclude -std=c17 -pedantic -Werror -DNDEBUG

_BIN    = a.out
BIN     = $(addprefix $(BINDIR)/, $(_BIN))

.PHONY: all
all: $(BINDIR) $(OBJDIR) $(BIN)

# link
$(BIN): $(OBJS) $(BINDIR)
	$(CC) -o $@ $(OBJS)

$(BINDIR):
	$(MKDIR) $(BINDIR)

# compile
$(OBJDIR)/%.o: $(SRCDIR)/%.c
	$(CC) $(CFLAGS) -c $< -o $@

$(OBJDIR):
	$(MKDIR) $(OBJDIR)

.PHONY: clean
clean:
	@echo "Cleaning up..."
	$(RM) $(OBJDIR) $(BINDIR)

.PHONY: verify
verify:
	$(VERIFY)

# macro review
print-%:
	@echo $* = $($*)
