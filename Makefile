CC		= gcc
SDIR	= src
BDIR	= bin
ODIR	= obj
MKDIR	= mkdir -pv
RM		= rm -rfv
INC		= -Iinclude
CFLAGS	= -Wall -std=c17 -pedantic -Werror -DNDBUG
SRC		= $(wildcard $(SDIR)/*.c)
OBJS	= $(patsubst $(SDIR)/%.c, $(ODIR)/%.o, $(SRC))

_BIN 	= a.out
BIN		= $(addprefix $(BDIR)/, $(_BIN))

.PHONY: all
all: $(OBJS) $(BIN)

# compiling
$(OBJS): $(SRC) $(ODIR)
	$(CC) $(CFLAGS) $(INC) -c $< -o $@

$(ODIR):
	$(MKDIR) $(ODIR)

# linking
$(BIN): $(OBJS) $(BDIR)
	$(CC) $< -o $@ 

$(BDIR):
	$(MKDIR) $(BDIR)

.PHONY: clean
clean:
	@echo Cleaning up...
	$(RM) $(ODIR) $(BDIR)

# macro review
print-%:
	@echo $* = $($*)