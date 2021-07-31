OS := $(shell uname -s)

ifeq ($(OS),Darwin)
   OBJFMT = -f macho64
else
   OBJFMT = -f elf64 -g dwarf2
endif

PROGS = testpopcntc testpopcntlutc testpopcntasm testpopcntlutasm \
	testpopcntinst
all: $(PROGS) 

.SUFFIXES:
.SUFFIXES: .o .asm .c
.SECONDARY:

.asm.o:
	yasm -P ebe.inc -Worphan-labels $(OBJFMT) -l $*.lst $<

.o:
	gcc -g -o $@ $<

testpopcntc: popcnt.c testpopcnt.c
	gcc -g -O3 -funroll-all-loops -o testpopcntc testpopcnt.c popcnt.c

testpopcntasm: popcnt.asm testpopcnt.c
	yasm -P ebe.inc -Worphan-labels $(OBJFMT) -l popcnt.lst popcnt.asm
	gcc -g -O3 -funroll-all-loops -o testpopcntasm testpopcnt.c popcnt.o

testpopcntlutc: popcntlut.c testpopcnt.c
	gcc -g -O3 -funroll-all-loops -o testpopcntlutc testpopcnt.c popcntlut.c

testpopcntlutasm: popcntlut.asm testpopcnt.c
	yasm -P ebe.inc -Worphan-labels $(OBJFMT) -l popcntlut.lst popcntlut.asm
	gcc -g -O3 -funroll-all-loops -o testpopcntlutasm testpopcnt.c popcntlut.o

testpopcntinst: popcntinst.asm testpopcnt.c
	yasm -P ebe.inc -Worphan-labels $(OBJFMT) -l popcntinst.lst popcntinst.asm
	gcc -g -O3 -funroll-all-loops -o testpopcntinst testpopcnt.c popcntinst.o

clean:
	rm -f $(PROGS) *.o *.lst *~ .*.gdb .ebe.*

