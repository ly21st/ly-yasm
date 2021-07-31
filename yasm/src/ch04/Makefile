OS := $(shell uname -s)

ifeq ($(OS),Darwin)
   OBJFMT = -f macho64
else
   OBJFMT = -f elf64 -g dwarf2
endif

PROGS = thrashtlb
all: $(PROGS) 

.SUFFIXES:
.SUFFIXES: .o .asm -c
.SECONDARY:

.asm.o:
	yasm -P ebe.inc -Worphan-labels $(OBJFMT) -l $*.lst $<


thrashtlb.o: thrashtlb.c
	gcc -g -Wall -O3 -funroll-all-loops -c $<
	
thrashtlb: thrashtlb.o
	gcc -g -o thrashtlb thrashtlb.o

clean:
	rm -f $(PROGS) *.o *.lst *~ .*.gdb .ebe.*
