.data
	formatScanfstr: .asciz "%s"
	sirhexa: .space 100
	sirb2: .space 15
	sirlet: .asciz "let"
	siradd: .asciz "add"
	sirsub: .asciz "sub"
	sirmul: .asciz "mul"
	sirdiv: .asciz "div"
	sirvid: .asciz ""
	formatPrintfnewline: .asciz "%s\n"
	formatPrintfstr: .asciz "%s "
	formatPrintfnrpoz: .asciz "%d "
	formatPrintfnrneg: .asciz "-%d "
	formatPrintfchr: .asciz "%c "
	indexsirb2: .long 0
.text

.global main

main:

pushl $sirhexa
pushl $formatScanfstr
call scanf
popl %ebx
popl %ebx

movl $sirhexa, %edi
movl $sirb2, %esi
xorl %ecx, %ecx

et_forhex:

movb (%edi, %ecx, 1), %al
cmp $0, %al
je et_exit
cmp $48, %al
je cif0
cmp $49, %al
je cif1
cmp $50, %al
je cif2
cmp $51, %al
je cif3
cmp $52, %al
je cif4
cmp $53, %al
je cif5
cmp $54, %al
je cif6
cmp $55, %al
je cif7
cmp $56, %al
je cif8
cmp $57, %al
je cif9
cmp $65, %al
je cifA
cmp $66, %al
je cifB
cmp $67, %al
je cifC
cmp $68, %al
je cifD
cmp $69, %al
je cifE
cmp $70, %al
je cifF

forhex_cont:

incl %ecx
movl %ecx, %eax
xorl %edx, %edx
movl $3, %ebx
div %ebx
cmp $0, %edx
je prelucrare_sirb2
jmp et_forhex


cif0:

pushl %ecx
movl indexsirb2, %ecx
movb $48, (%esi, %ecx, 1)
incl %ecx
movb $48, (%esi, %ecx, 1)
incl %ecx
movb $48, (%esi, %ecx, 1)
incl %ecx
movb $48, (%esi, %ecx, 1)
incl %ecx
addl $4, indexsirb2
popl %ecx
jmp forhex_cont

cif1:

pushl %ecx
movl indexsirb2, %ecx
movb $48, (%esi, %ecx, 1)
incl %ecx
movb $48, (%esi, %ecx, 1)
incl %ecx
movb $48, (%esi, %ecx, 1)
incl %ecx
movb $49, (%esi, %ecx, 1)
incl %ecx
addl $4, indexsirb2
popl %ecx
jmp forhex_cont

cif2:

pushl %ecx
movl indexsirb2, %ecx
movb $48, (%esi, %ecx, 1)
incl %ecx
movb $48, (%esi, %ecx, 1)
incl %ecx
movb $49, (%esi, %ecx, 1)
incl %ecx
movb $48, (%esi, %ecx, 1)
incl %ecx
addl $4, indexsirb2
popl %ecx
jmp forhex_cont

cif3:

pushl %ecx
movl indexsirb2, %ecx
movb $48, (%esi, %ecx, 1)
incl %ecx
movb $48, (%esi, %ecx, 1)
incl %ecx
movb $49, (%esi, %ecx, 1)
incl %ecx
movb $49, (%esi, %ecx, 1)
incl %ecx
addl $4, indexsirb2
popl %ecx
jmp forhex_cont

cif4:

pushl %ecx
movl indexsirb2, %ecx
movb $48, (%esi, %ecx, 1)
incl %ecx
movb $49, (%esi, %ecx, 1)
incl %ecx
movb $48, (%esi, %ecx, 1)
incl %ecx
movb $48, (%esi, %ecx, 1)
incl %ecx
addl $4, indexsirb2
popl %ecx
jmp forhex_cont

cif5:

pushl %ecx
movl indexsirb2, %ecx
movb $48, (%esi, %ecx, 1)
incl %ecx
movb $49, (%esi, %ecx, 1)
incl %ecx
movb $48, (%esi, %ecx, 1)
incl %ecx
movb $49, (%esi, %ecx, 1)
incl %ecx
addl $4, indexsirb2
popl %ecx
jmp forhex_cont

cif6:

pushl %ecx
movl indexsirb2, %ecx
movb $48, (%esi, %ecx, 1)
incl %ecx
movb $49, (%esi, %ecx, 1)
incl %ecx
movb $49, (%esi, %ecx, 1)
incl %ecx
movb $48, (%esi, %ecx, 1)
incl %ecx
addl $4, indexsirb2
popl %ecx
jmp forhex_cont

cif7:

pushl %ecx
movl indexsirb2, %ecx
movb $48, (%esi, %ecx, 1)
incl %ecx
movb $49, (%esi, %ecx, 1)
incl %ecx
movb $49, (%esi, %ecx, 1)
incl %ecx
movb $49, (%esi, %ecx, 1)
incl %ecx
addl $4, indexsirb2
popl %ecx
jmp forhex_cont

cif8:

pushl %ecx
movl indexsirb2, %ecx
movb $49, (%esi, %ecx, 1)
incl %ecx
movb $48, (%esi, %ecx, 1)
incl %ecx
movb $48, (%esi, %ecx, 1)
incl %ecx
movb $48, (%esi, %ecx, 1)
incl %ecx
addl $4, indexsirb2
popl %ecx
jmp forhex_cont

cif9:

pushl %ecx
movl indexsirb2, %ecx
movb $49, (%esi, %ecx, 1)
incl %ecx
movb $48, (%esi, %ecx, 1)
incl %ecx
movb $48, (%esi, %ecx, 1)
incl %ecx
movb $49, (%esi, %ecx, 1)
incl %ecx
addl $4, indexsirb2
popl %ecx
jmp forhex_cont

cifA:

pushl %ecx
movl indexsirb2, %ecx
movb $49, (%esi, %ecx, 1)
incl %ecx
movb $48, (%esi, %ecx, 1)
incl %ecx
movb $49, (%esi, %ecx, 1)
incl %ecx
movb $48, (%esi, %ecx, 1)
incl %ecx
addl $4, indexsirb2
popl %ecx
jmp forhex_cont

cifB:

pushl %ecx
movl indexsirb2, %ecx
movb $49, (%esi, %ecx, 1)
incl %ecx
movb $48, (%esi, %ecx, 1)
incl %ecx
movb $49, (%esi, %ecx, 1)
incl %ecx
movb $49, (%esi, %ecx, 1)
incl %ecx
addl $4, indexsirb2
popl %ecx
jmp forhex_cont

cifC:

pushl %ecx
movl indexsirb2, %ecx
movb $49, (%esi, %ecx, 1)
incl %ecx
movb $49, (%esi, %ecx, 1)
incl %ecx
movb $48, (%esi, %ecx, 1)
incl %ecx
movb $48, (%esi, %ecx, 1)
incl %ecx
addl $4, indexsirb2
popl %ecx
jmp forhex_cont

cifD:

pushl %ecx
movl indexsirb2, %ecx
movb $49, (%esi, %ecx, 1)
incl %ecx
movb $49, (%esi, %ecx, 1)
incl %ecx
movb $48, (%esi, %ecx, 1)
incl %ecx
movb $49, (%esi, %ecx, 1)
incl %ecx
addl $4, indexsirb2
popl %ecx
jmp forhex_cont

cifE:

pushl %ecx
movl indexsirb2, %ecx
movb $49, (%esi, %ecx, 1)
incl %ecx
movb $49, (%esi, %ecx, 1)
incl %ecx
movb $49, (%esi, %ecx, 1)
incl %ecx
movb $48, (%esi, %ecx, 1)
incl %ecx
addl $4, indexsirb2
popl %ecx
jmp forhex_cont

cifF:

pushl %ecx
movl indexsirb2, %ecx
movb $49, (%esi, %ecx, 1)
incl %ecx
movb $49, (%esi, %ecx, 1)
incl %ecx
movb $49, (%esi, %ecx, 1)
incl %ecx
movb $49, (%esi, %ecx, 1)
incl %ecx
addl $4, indexsirb2
popl %ecx
jmp forhex_cont

prelucrare_sirb2:

xorl %eax, %eax
xorl %ebx, %ebx
movb 1(%esi, %ebx, 1), %al
cmp $48, %al
je et_bit1_0
jmp et_operatie

cont_prelucrare:

movl $0, indexsirb2
jmp et_forhex

et_bit1_0:

xorl %edx, %edx
movb 4(%esi, %ebx, 1), %al
cmp $49, %al
je add_7

cont_after7:

movb 5(%esi, %ebx, 1), %al
cmp $49, %al
je add_6

cont_after6:

movb 6(%esi, %ebx, 1), %al
cmp $49, %al
je add_5

cont_after5:

movb 7(%esi, %ebx, 1), %al
cmp $49, %al
je add_4

cont_after4:

movb 8(%esi, %ebx, 1), %al
cmp $49, %al
je add_3

cont_after3:

movb 9(%esi, %ebx, 1), %al
cmp $49, %al
je add_2

cont_after2:

movb 10(%esi, %ebx, 1), %al
cmp $49, %al
je add_1

cont_after1:

movb 11(%esi, %ebx, 1), %al
cmp $49, %al
je add_0

cont_after0:

xorl %eax, %eax
movb 2(%esi, %ebx, 1), %al
cmp $48, %al
je et_numar_intreg
jmp et_variabila

et_numar_intreg:

movb 3(%esi, %ebx, 1), %al
cmp $48, %al
je et_numarpoz
jmp et_numarneg

et_numarpoz:

movl %ecx, %ebx
pushl %edx
pushl $formatPrintfnrpoz
call printf
popl %eax
popl %eax
movl %ebx, %ecx
jmp cont_prelucrare

et_numarneg:

movl %ecx, %ebx
pushl %edx
pushl $formatPrintfnrneg
call printf
popl %eax
popl %eax
movl %ebx, %ecx
jmp cont_prelucrare

et_variabila:

movl %ecx, %ebx
pushl %edx
pushl $formatPrintfchr
call printf
popl %eax
popl %eax
movl %ebx, %ecx
jmp cont_prelucrare

et_operatie:

xorl %eax, %eax
movb 9(%esi, %ebx, 1), %al
cmp $48, %al
je et_op0
jmp et_div

et_op0:

xorl %eax, %eax
movb 10(%esi, %ebx, 1), %al
cmp $48, %al
je et_op00
jmp et_op01

et_op00:

xorl %eax, %eax
movb 11(%esi, %ebx, 1), %al
cmp $48, %al
je et_let
jmp et_add

et_op01:

xorl %eax, %eax
movb 11(%esi, %ebx, 1), %al
cmp $48, %al
je et_sub
jmp et_mul

et_let:

movl %ecx, %ebx
pushl $sirlet
pushl $formatPrintfstr
call printf
popl %eax
popl %eax
movl %ebx, %ecx
jmp cont_prelucrare

et_add:

movl %ecx, %ebx
pushl $siradd
pushl $formatPrintfstr
call printf
popl %eax
popl %eax
movl %ebx, %ecx
jmp cont_prelucrare

et_sub:

movl %ecx, %ebx
pushl $sirsub
pushl $formatPrintfstr
call printf
popl %eax
popl %eax
movl %ebx, %ecx
jmp cont_prelucrare

et_mul:

movl %ecx, %ebx
pushl $sirmul
pushl $formatPrintfstr
call printf
popl %eax
popl %eax
movl %ebx, %ecx
jmp cont_prelucrare

et_div:

movl %ecx, %ebx
pushl $sirdiv
pushl $formatPrintfstr
call printf
popl %eax
popl %eax
movl %ebx, %ecx
jmp cont_prelucrare

add_0:

add $1, %edx
jmp cont_after0

add_1:

add $2, %edx
jmp cont_after1

add_2:

add $4, %edx
jmp cont_after2

add_3:

add $8, %edx
jmp cont_after3

add_4:

add $16, %edx
jmp cont_after4

add_5:

add $32, %edx
jmp cont_after5

add_6:

add $64, %edx
jmp cont_after6

add_7:

add $128, %edx
jmp cont_after7


et_exit:

pushl $sirvid
pushl $formatPrintfnewline
call printf
popl %eax
popl %eax


movl $1, %eax
xorl %ebx, %ebx
int $0x80
