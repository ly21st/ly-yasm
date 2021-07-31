	.file	"test.c"
	.text
	.globl	foo
	.type	foo, @function
foo:
.LFB20:
	.cfi_startproc
	movl	$1, -16(%rsp)
	movl	$3, -12(%rsp)
	movl	$5, -8(%rsp)
	movslq	%edi, %rdi
	movl	-16(%rsp,%rdi,4), %eax
	ret
	.cfi_endproc
.LFE20:
	.size	foo, .-foo
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC0:
	.string	"i=%d,j=%d\n"
	.text
	.globl	main
	.type	main, @function
main:
.LFB21:
	.cfi_startproc
	subq	$8, %rsp
	.cfi_def_cfa_offset 16
	movl	$1, %edi
	call	foo
	movl	%eax, %ecx
	movl	$1, %edx
	movl	$.LC0, %esi
	movq	stdout(%rip), %rdi
	movl	$0, %eax
	call	fprintf
	movl	$0, %eax
	addq	$8, %rsp
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE21:
	.size	main, .-main
	.ident	"GCC: (GNU) 4.8.5 20150623 (Red Hat 4.8.5-39)"
	.section	.note.GNU-stack,"",@progbits
