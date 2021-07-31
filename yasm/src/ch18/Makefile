OS := $(shell uname -s)

ifeq ($(OS),Darwin)
   OBJFMT = -f macho64
else
   OBJFMT = -f elf64 -g dwarf2
endif

PROGS = testsobelc testsobelsse
all: $(PROGS) 

.SUFFIXES:
.SUFFIXES: .o .asm .c
.SECONDARY:

.asm.o:
	yasm -Worphan-labels -P ebe.inc $(OBJFMT) -l $*.lst $<

.o:
	gcc -g -o $@ $<

testsobelc: testsobel.c sobel.c
	gcc -g -O3 -funroll-all-loops -o testsobelc testsobel.c sobel.c -lm

testsobelsse: testsobel.c sobelsse.asm
	yasm -Worphan-labels -P ebe.inc $(OBJFMT) -l sobelsse.lst sobelsse.asm
	gcc -g -O3 -funroll-all-loops -o testsobelsse testsobel.c sobelsse.o -lm

clean:
	rm -f $(PROGS) *.o *.lst *~ .*.gdb .ebe.*
