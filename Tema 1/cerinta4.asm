.data

MatrixA: .space 1600
MatrixB: .space 1600
sir: .space 2000
LineIndex: .long 0
ColumnIndex: .long 0
lines: .space 4
columns: .space 4
Len: .space 4
const: .space 4
sirvid: .asciz ""
formatnewline: .asciz "%s\n"
formatprintf: .asciz "%d "
delim: .asciz " \n"

.text
.global main

main:

pushl $sir
call gets
popl %ebx

pushl $delim
pushl $sir
call strtok
popl %ecx
popl %ecx

pushl $delim
pushl $0
call strtok
popl %ecx
popl %ecx

pushl %eax
call atoi
popl %ecx
movl %eax, lines

pushl $delim
pushl $0
call strtok
popl %ecx
popl %ecx

pushl %eax
call atoi
popl %ecx
movl %eax, columns

xorl %edx, %edx
movl lines, %ebx
mul %ebx
movl %eax, Len

xorl %ebx, %ebx
movl $MatrixA, %edi

et_parcurgere:

cmp %ebx, Len
je et_cont_program

pushl $delim
pushl $0
call strtok
popl %ecx
popl %ecx

pushl %eax
call atoi
popl %ecx

movl %eax, (%edi, %ebx, 4)
incl %ebx
jmp et_parcurgere

et_cont_program:

pushl $delim
pushl $0
call strtok
popl %ecx
popl %ecx

pushl $delim
pushl $0
call strtok
popl %ecx
popl %ecx

movl %eax, %ebx
pushl %eax
call strlen
popl %ecx
cmp $1, %eax
jne et_rotire_or_op
jmp et_op

et_rotire_or_op:

pushl %ebx
call atoi
popl %ebx
cmp $0, %eax
je et_rotire
jmp et_const

et_rotire:

movl $MatrixA, %esi
movl $MatrixB, %edi

for_n:
movl $0, ColumnIndex
movl LineIndex, %ecx
cmp %ecx, lines
je afis_B

  for_m:
  movl ColumnIndex, %ecx
  cmp %ecx, columns
  je incr_jmp
  xorl %edx, %edx
  movl lines, %eax
  movl LineIndex, %ecx
  mul %ecx
  add ColumnIndex, %eax
  movl (%esi, %eax, 4), %ebx
  xorl %edx, %edx
  movl columns, %eax
  movl ColumnIndex, %ecx
  mul %ecx
  add LineIndex, %eax
  movl %ebx, (%edi, %eax, 4)
  incl ColumnIndex
  jmp for_m
  
  incr_jmp:
  
  incl LineIndex
  jmp for_n

et_op:

pushl %ebx
call atoi
popl %ecx
cmp $0, %eax
jne et_const
pushl $delim
pushl $0
call strtok
popl %ecx
popl %ecx
pushl %eax
call atoi
popl %ecx
jmp et_const

et_const:

movl %eax, const
pushl $delim
pushl $0
call strtok
popl %ecx
popl %ecx

xorl %ecx, %ecx
xorl %edx, %edx
movb (%eax, %edx, 1), %cl
cmp $97, %cl
je et_add
cmp $115, %cl
je et_sub
cmp $109, %cl
je et_mul
cmp $100, %cl
je et_div

et_add:

xorl %ecx, %ecx
movl $MatrixA, %esi

for_add_Len:

cmp %ecx, Len
je afis_A
movl (%esi, %ecx, 4), %eax
add const, %eax
movl %eax, (%esi, %ecx, 4)
incl %ecx
jmp for_add_Len

et_sub:

xorl %ecx, %ecx
movl $MatrixA, %esi

for_sub_Len:

cmp %ecx, Len
je afis_A
movl (%esi, %ecx, 4), %eax
sub const, %eax
movl %eax, (%esi, %ecx, 4)
incl %ecx
jmp for_sub_Len

et_mul:

xorl %ecx, %ecx
movl $MatrixA, %esi

for_mul_Len:

cmp %ecx, Len
je afis_A
movl (%esi, %ecx, 4), %eax
xorl %edx, %edx
movl const, %ebx
imul %ebx
movl %eax, (%esi, %ecx, 4)
incl %ecx
jmp for_mul_Len

et_div:

xorl %ecx, %ecx
movl $MatrixA, %esi

for_div_Len:

cmp %ecx, Len
je afis_A
movl (%esi, %ecx, 4), %eax
xorl %edx, %edx
xorl %ebx, %ebx
movl const, %ebx
cdq
idiv %ebx
movl %eax, (%esi, %ecx, 4)
incl %ecx
jmp for_div_Len

afis_A:

pushl lines
pushl $formatprintf
call printf
popl %ebx
popl %ebx

pushl columns
pushl $formatprintf
call printf
popl %ebx
popl %ebx

xorl %ecx, %ecx
movl $MatrixA, %esi

for_afisA:
cmp %ecx, Len
je exit
movl (%esi, %ecx, 4), %eax
pushl %ecx
pushl %eax
pushl $formatprintf
call printf
popl %ebx
popl %ebx
popl %ecx
incl %ecx
jmp for_afisA

afis_B:

pushl columns
pushl $formatprintf
call printf
popl %ebx
popl %ebx

pushl lines
pushl $formatprintf
call printf
popl %ebx
popl %ebx

xorl %ecx, %ecx
movl $MatrixB, %esi

for_afisB:
cmp %ecx, Len
je exit
movl (%esi, %ecx, 4), %eax
pushl %ecx
pushl %eax
pushl $formatprintf
call printf
popl %ebx
popl %ebx
popl %ecx
incl %ecx
jmp for_afisB

exit:

pushl $sirvid
pushl $formatnewline
call printf
popl %ebx
popl %ebx

mov $1, %eax
xorl %ebx, %ebx
int $0x80
