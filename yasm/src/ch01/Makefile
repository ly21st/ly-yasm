OS := $(shell uname -s)

ifeq ($(OS),Darwin)
   PROGS = exit_osx
   OBJFMT = -f macho64
else
   PROGS = exit
   OBJFMT = -f elf64 -g dwarf2
endif

all: $(PROGS) 

.SUFFIXES:
.SUFFIXES: .o .asm
.SECONDARY:

.o:
	gcc -g -o $@ $<

.asm.o:
	yasm -P ebe.inc -Worphan-labels $(OBJFMT) -l $*.lst $<

exit: exit.o
	ld -o exit exit.o

exit_osx: exit_osx.o
	ld -o exit_osx exit_osx.o

clean:
	rm -f $(PROGS) *.o *.lst *~ .ebe.*
