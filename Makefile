CC		= gcc
SRCDIR	= src
BINDIR	= bin
OBJDIR	= obj
MKDIR	= mkdir -pv
RM		= rm -rfv
VERIFY	= cat -e -t -v Makefile
CFLAGS  = -Wall -g -std=c17 -pedantic -Iinclude -Werror -DNDEBUG
SRC		= $(wildcard $(SRCDIR)/*.c)
OBJS	= $(patsubst $(SRCDIR)/%.c,$(OBJDIR)/%.o,$(SRC))

# executable
# executable
_EXE = a.out
BIN  = $(addprefix $(BINDIR)/,$(_EXE))

# default recipe
.PHONY: all
all: $(OBJDIR) $(BINDIR) $(BIN)
		
# runs second
#linking
$(BIN): $(OBJS) $(BINDIR)
	$(CC) $(CFLAGS) -o $@ $(OBJS)

$(BINDIR):
	$(MKDIR) $(BINDIR)

# runs first
# compiling
$(OBJDIR)/%.o: $(SRC)
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

print-%:
	@echo $* = $($*)
