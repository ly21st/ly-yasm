	.file	"test2.c"
	.text
	.globl	foo
	.type	foo, @function
foo:
.LFB20:
	.cfi_startproc
	movl	$100, -32(%rsp)
	movl	$200, -28(%rsp)
	movl	$300, -24(%rsp)
	movl	$400, -20(%rsp)
	movl	$500, -16(%rsp)
	movl	$600, -12(%rsp)
	movl	$700, -8(%rsp)
	movslq	%edi, %rdi
	movslq	8(%rsp), %rdx
	movl	-32(%rsp,%rdi,4), %eax
	addl	-32(%rsp,%rdx,4), %eax
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
	subq	$24, %rsp
	.cfi_def_cfa_offset 32
	movl	$6, (%rsp)
	movl	$5, %r9d
	movl	$4, %r8d
	movl	$3, %ecx
	movl	$2, %edx
	movl	$1, %esi
	movl	$0, %edi
	call	foo
	movl	%eax, %ecx
	movl	$1, %edx
	movl	$.LC0, %esi
	movq	stdout(%rip), %rdi
	movl	$0, %eax
	call	fprintf
	movl	$0, %eax
	addq	$24, %rsp
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE21:
	.size	main, .-main
	.ident	"GCC: (GNU) 4.8.5 20150623 (Red Hat 4.8.5-39)"
	.section	.note.GNU-stack,"",@progbits
