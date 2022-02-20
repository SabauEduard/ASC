.data 
sir: .space 100
delim: .asciz " \n"
formatPrintf: .asciz "%d\n"



.text
.global main
main:

pushl $sir
call gets
popl %ebx
xorl %ebx, %ebx

pushl $delim
pushl $sir
call strtok
popl %ecx
popl %ecx

movl %eax, %edi

et_parcurgere:
cmp $0, %edi
je exit


pushl %edi
call atoi
popl %ecx


cmp $0, %eax
je et_op

pushl %eax

et_cont_parcurgere:

pushl $delim
pushl $0
call strtok
popl %ecx
popl %ecx
movl %eax, %edi

jmp et_parcurgere

et_op:

xorl %edx, %edx
movb (%edi, %edx, 1), %cl
cmp $97, %cl
je et_add

cmp $115, %cl
je et_sub

cmp $109, %cl
je et_mul

cmp $100, %cl
je et_div

et_add:

popl %eax
popl %edx
add %eax, %edx
movl %edx, %ebx
pushl %ebx
jmp et_cont_parcurgere

et_sub:

popl %eax
popl %edx
sub %eax, %edx
movl %edx, %ebx
pushl %ebx
jmp et_cont_parcurgere

et_mul:

popl %eax
popl %ecx
xorl %edx, %edx
imul %ecx
movl %eax, %ebx
pushl %ebx
jmp et_cont_parcurgere

et_div:

popl %ecx
popl %eax
xorl %edx, %edx
idiv %ecx
movl %eax, %ebx
pushl %ebx
jmp et_cont_parcurgere



exit:

popl %ebx
pushl %ebx
pushl $formatPrintf
call printf
popl %eax
popl %eax

mov $1, %eax
xorl %ebx, %ebx
int $0x80
