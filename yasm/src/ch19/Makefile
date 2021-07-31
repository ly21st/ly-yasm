OS := $(shell uname -s)

ifeq ($(OS),Darwin)
   OBJFMT = -f macho64
else
   OBJFMT = -f elf64 -g dwarf2
endif

PROGS = testcorrc testcorrasm testcorravx
all: $(PROGS) 

.SUFFIXES:
.SUFFIXES: .o .asm .c
.SECONDARY:

.asm.o:
	yasm -Worphan-labels -P ebe.inc $(OBJFMT) -l $*.lst $<

.o:
	gcc -g -o $@ $<

testcorrc: testcorr.c corr.c
	gcc -g -O3 -funroll-all-loops -o testcorrc testcorr.c corr.c -lm

testcorrasm: testcorr.c corr.asm
	yasm -Worphan-labels -P ebe.inc $(OBJFMT) -l corr.lst corr.asm
	gcc -g -O3 -funroll-all-loops -o testcorrasm testcorr.c corr.o -lm

testcorravx: testcorr.c corravx.asm
	yasm -Worphan-labels -P ebe.inc $(OBJFMT) -l corravx.lst corravx.asm
	gcc -g -O3 -funroll-all-loops -o testcorravx testcorr.c corravx.o -lm

clean:
	rm -f $(PROGS) *.o *.lst *~ .*.gdb .ebe.*
