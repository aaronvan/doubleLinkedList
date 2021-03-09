SHELL	= /bin/zsh
.SUFFIXES:
.SUFFIXES: .c .h .o

CC		= gcc
SDIR	= src
BDIR	= bin
ODIR	= obj
MKDIR	= mkdir -pv
RM		= rm -rfv
INC		= -Iinclude
CFLAGS	= -Wall -std=c17 -pedantic
SRC		= $(wildcard $(SDIR)/*.c)


_BIN 	= a.out
BIN		= $(addprefix $(BDIR)/, $(_BIN))

.PHONY: all
all: $(BDIR) $(BIN)

$(BIN): $(SRC)
	$(CC) $(INC) $^ -o $@

$(BDIR):
	$(MKDIR) $(BDIR)

.PHONY: clean
clean:
	@echo Cleaning up...
	$(RM) $(BDIR)