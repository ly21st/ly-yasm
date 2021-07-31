	.file	"test.c"
	.text
	.globl	foo
	.type	foo, @function
foo:
.LFB2:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movl	%edi, -20(%rbp)
	movl	$1, -16(%rbp)
	movl	$3, -12(%rbp)
	movl	$5, -8(%rbp)
	movl	-20(%rbp), %eax
	cltq
	movl	-16(%rbp,%rax,4), %eax
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE2:
	.size	foo, .-foo
	.section	.rodata
.LC0:
	.string	"i=%d,j=%d\n"
	.text
	.globl	main
	.type	main, @function
main:
.LFB3:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$32, %rsp
	movl	%edi, -20(%rbp)
	movq	%rsi, -32(%rbp)
	movl	$1, -4(%rbp)
	movl	-4(%rbp), %eax
	movl	%eax, %edi
	call	foo
	movl	%eax, -8(%rbp)
	movq	stdout(%rip), %rax
	movl	-8(%rbp), %ecx
	movl	-4(%rbp), %edx
	movl	$.LC0, %esi
	movq	%rax, %rdi
	movl	$0, %eax
	call	fprintf
	movl	$0, %eax
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE3:
	.size	main, .-main
	.ident	"GCC: (GNU) 4.8.5 20150623 (Red Hat 4.8.5-39)"
	.section	.note.GNU-stack,"",@progbits
