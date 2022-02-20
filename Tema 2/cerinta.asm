.data

ok: .space 4
n: .space 4
n_1: .space 4
m: .space 4
n3_1: .space 4
v: .space 400
sir: .space 400
poz1: .space 150
poz2: .space 150
poz3: .space 150
formatPrintf: .asciz "%d "
formatPrintnl: .asciz "%s"
formatTest: .asciz "%d\n"
sirnl: .asciz "\n"
delim: .asciz " \n"

.text

.global main

bkt:

pushl %ebp
movl %esp, %ebp
pushl %ebx
pushl %edi
pushl %esi

movl $1, %ecx
cmp $1, ok
jne et_verif2

popl %esi
popl %edi
popl %ebx
popl %ebp
movl $1, %eax
ret


et_verif2:

movl 8(%ebp), %edx
cmp %edx, n3_1
jne et_verif3

popl %esi
popl %edi
popl %ebx
popl %ebp
movl $1, ok
movl $1, %eax
ret


et_verif3:

movl 8(%ebp), %edx
lea v, %edi
movl (%edi, %edx, 4), %ebx
cmp $0, %ebx
je for_generare
mov $1, %eax
movl 8(%ebp), %edx
add $1, %edx
pushl %ecx
pushl %edx
call bkt
popl %ebx
popl %ecx
popl %esi
popl %edi
popl %ebx
popl %ebp

ret


for_generare:

cmp %ecx, n_1
je bkt_final

lea poz3, %edi
movl (%edi, %ecx, 4), %ebx
cmp $0, %ebx
jne cont_for_generare

lea poz2, %edi
movl (%edi, %ecx, 4), %ebx
cmp $0, %ebx
jne else_testare2

lea poz1, %edi
movl (%edi, %ecx, 4), %ebx
cmp $0, %ebx
jne else_testare3

movl 8(%ebp), %edx
movl %edx, (%edi, %ecx, 4)
lea v, %edi
movl %ecx, (%edi, %edx, 4) 
add $1, %edx
pushl %ecx
pushl %edx
call bkt
popl %edx
popl %ecx
cmp $1, ok
jne else_testare4

popl %esi
popl %edi
popl %ebx
popl %ebp
mov $1, %eax
ret


else_testare4:

lea poz1, %edi
movl $0, (%edi, %ecx, 4)
lea v, %edi
movl 8(%ebp), %edx
movl $0, (%edi, %edx, 4) 
jmp cont_for_generare


else_testare3:

lea poz1, %edi
movl (%edi, %ecx, 4), %ebx
movl 8(%ebp), %edx
sub %edx, %ebx
movl %ebx, %eax
sar $31, %eax
xorl %eax, %ebx
sub %eax, %ebx
cmp %ebx, m
jge cont_for_generare

lea poz2, %edi
movl 8(%ebp), %edx
movl %edx, (%edi, %ecx, 4)
lea v, %edi
movl %ecx, (%edi, %edx, 4)
add $1, %edx
pushl %ecx
pushl %edx
call bkt
popl %edx
popl %ecx
cmp $1, ok
jne else_testare5

popl %esi
popl %edi
popl %ebx
popl %ebp
mov $1, %eax
ret


else_testare5:

lea poz2, %edi
movl $0, (%edi, %ecx, 4)
movl 8(%ebp), %edx
lea v, %edi
movl $0, (%edi, %edx, 4)
jmp cont_for_generare


else_testare2:

lea poz1, %edi
movl (%edi, %ecx, 4), %ebx
movl 8(%ebp), %edx
sub %edx, %ebx
movl %ebx, %eax
sar $31, %eax
xorl %eax, %ebx
sub %eax, %ebx
cmp %ebx, m
jge cont_for_generare

lea poz2, %edi
movl (%edi, %ecx, 4), %ebx
movl 8(%ebp), %edx
sub %edx, %ebx
movl %ebx, %eax
sar $31, %eax
xorl %eax, %ebx
sub %eax, %ebx
cmp %ebx, m
jge cont_for_generare

lea poz3, %edi
movl 8(%ebp), %edx
movl %edx, (%edi, %ecx, 4)
lea v, %edi
movl %ecx, (%edi, %edx, 4)
add $1, %edx
pushl %ecx
pushl %edx
call bkt
popl %edx
popl %ecx
cmp $1, ok
jne else_testare6

popl %esi
popl %edi
popl %ebx
popl %ebp
mov $1, %eax
ret

else_testare6:

lea poz3, %edi
movl $0, (%edi, %ecx, 4)
lea v, %edi
movl 8(%ebp), %edx
movl $0, (%edi, %edx, 4)


cont_for_generare:

incl %ecx
jmp for_generare


bkt_final:

popl %esi
popl %edi
popl %ebx
popl %ebp
mov $0, %eax
ret


main:

movl $0, ok
pushl $sir
call gets
popl %ebx


pushl $delim
pushl $sir
call strtok
popl %ebx
popl %ebx

pushl %eax
call atoi
popl %ebx
movl %eax, n
add $1, %eax
movl %eax, n_1

pushl $delim
pushl $0
call strtok
popl %ebx
popl %ebx

pushl %eax
call atoi
popl %ebx
movl %eax, m

movl $1, %ecx
xorl %edx, %edx
movl $3, %ebx
movl n, %eax
mull %ebx
add $1, %eax
movl %eax, n3_1
lea v, %esi


for_citire:

cmp %ecx, n3_1
je continuare

pushl %ecx
pushl $delim
pushl $0
call strtok
popl %ebx
popl %ebx
pushl %eax
call atoi
popl %ebx
popl %ecx
movl %eax, (%esi, %ecx, 4)
cmp $0, %eax
je et_sfarsit_for
lea poz1, %edi
movl (%edi, %eax, 4), %ebx
cmp $0, %ebx
jne et_aparitie2
movl %ecx, (%edi, %eax, 4)
jmp et_sfarsit_for

et_aparitie2:
lea poz2, %edi
movl (%edi, %eax, 4), %ebx
cmp $0, %ebx
jne et_aparitie3
movl %ecx, (%edi, %eax, 4)
jmp et_sfarsit_for

et_aparitie3:
lea poz3, %edi
movl (%edi, %eax, 4), %ebx
cmp $0, %ebx
jne et_nu_are_solutie
movl %ecx, (%edi, %eax, 4)

et_sfarsit_for:
incl %ecx
jmp for_citire


continuare:

pushl $1
call bkt
popl %ebx

cmp $1, %eax
jne et_nu_are_solutie

movl $1, %ecx
lea v, %edi


for_afisare:

cmp %ecx, n3_1
je exit
pushl %ecx
pushl (%edi, %ecx, 4)
pushl $formatPrintf
call printf
popl %ebx
popl %ebx
popl %ecx
incl %ecx
jmp for_afisare


et_nu_are_solutie:

pushl $-1
pushl $formatPrintf
call printf
popl %ebx
popl %ebx


exit:

pushl $sirnl
pushl $formatPrintnl
call printf
popl %ebx
popl %ebx
movl $1, %eax
xorl %ebx, %ebx
int $0x80

