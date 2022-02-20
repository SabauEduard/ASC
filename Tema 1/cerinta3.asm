.data 
sir: .space 100
delim: .asciz " \n"
formatPrintf: .asciz "%d\n"
q: .long 0
w: .long 0
e: .long 0
r: .long 0
t: .long 0
y: .long 0
u: .long 0
i: .long 0
o: .long 0
p: .long 0
a: .long 0
s: .long 0
d: .long 0
f: .long 0
g: .long 0
h: .long 0
j: .long 0
k: .long 0
l: .long 0
z: .long 0
x: .long 0
c: .long 0
v: .long 0
b: .long 0
n: .long 0
m: .long 0


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
je et_litera

pushl %eax

et_cont_parcurgere:

pushl $delim
pushl $0
call strtok
popl %ecx
popl %ecx
movl %eax, %edi

jmp et_parcurgere

et_litera:

pushl %edi
call strlen
popl %ecx
cmp $1, %eax
jg et_op
jmp et_var

et_var:

xorl %ecx, %ecx
xorl %edx, %edx
movb (%edi, %edx, 1), %cl
cmp $97, %cl
je et_a
cmp $98, %cl
je et_b
cmp $99, %cl
je et_c
cmp $100, %cl
je et_d
cmp $101, %cl
je et_e
cmp $102, %cl
je et_f
cmp $103, %cl
je et_g
cmp $104, %cl
je et_h
cmp $105, %cl
je et_i
cmp $106, %cl
je et_j
cmp $107, %cl
je et_k
cmp $108, %cl
je et_l
cmp $109, %cl
je et_m
cmp $110, %cl
je et_n
cmp $111, %cl
je et_o
cmp $112, %cl
je et_p
cmp $113, %cl
je et_q
cmp $114, %cl
je et_r
cmp $115, %cl
je et_s
cmp $116, %cl
je et_t
cmp $117, %cl
je et_u
cmp $118, %cl
je et_v
cmp $119, %cl
je et_w
cmp $120, %cl
je et_x
cmp $121, %cl
je et_y
cmp $122, %cl
je et_z


et_add:

popl %eax
popl %edx
add %eax, %edx
movl %edx, %ebx
pushl %ebx
jmp et_cont_parcurgere

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

cmp $108, %cl
je et_let

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

et_let:

popl %eax
popl %ecx
cmp $97, %ecx
je et_inloc_a
cmp $98, %ecx
je et_inloc_b
cmp $99, %ecx
je et_inloc_c
cmp $100, %ecx
je et_inloc_d
cmp $101, %ecx
je et_inloc_e
cmp $102, %ecx
je et_inloc_f
cmp $103, %ecx
je et_inloc_g
cmp $104, %ecx
je et_inloc_h
cmp $105, %ecx
je et_inloc_i
cmp $106, %ecx
je et_inloc_j
cmp $107, %ecx
je et_inloc_k
cmp $108, %ecx
je et_inloc_l
cmp $109, %ecx
je et_inloc_m
cmp $110, %ecx
je et_inloc_n
cmp $111, %ecx
je et_inloc_o
cmp $112, %ecx
je et_inloc_p
cmp $113, %ecx
je et_inloc_q
cmp $114, %ecx
je et_inloc_r
cmp $115, %ecx
je et_inloc_s
cmp $116, %ecx
je et_inloc_t
cmp $117, %ecx
je et_inloc_u
cmp $118, %ecx
je et_inloc_v
cmp $119, %ecx
je et_inloc_w
cmp $120, %ecx
je et_inloc_x
cmp $121, %ecx
je et_inloc_y
cmp $122, %ecx
je et_inloc_z

et_a:

movl a, %ebx
cmp $0, %ebx
je et_push_chr
jmp et_push_nr_a

et_b:

movl b, %ebx
cmp $0, %ebx
je et_push_chr
jmp et_push_nr_b

et_c:

movl c, %ebx
cmp $0, %ebx
je et_push_chr
jmp et_push_nr_c

et_d:

movl d, %ebx
cmp $0, %ebx
je et_push_chr
jmp et_push_nr_d

et_e:

movl e, %ebx
cmp $0, %ebx
je et_push_chr
jmp et_push_nr_e

et_f:

movl f, %ebx
cmp $0, %ebx
je et_push_chr
jmp et_push_nr_f

et_g:

movl g, %ebx
cmp $0, %ebx
je et_push_chr
jmp et_push_nr_g

et_h:

movl h, %ebx
cmp $0, %ebx
je et_push_chr
jmp et_push_nr_h

et_i:

movl i, %ebx
cmp $0, %ebx
je et_push_chr
jmp et_push_nr_i

et_j:

movl j, %ebx
cmp $0, %ebx
je et_push_chr
jmp et_push_nr_j

et_k:

movl k, %ebx
cmp $0, %ebx
je et_push_chr
jmp et_push_nr_k

et_l:

movl l, %ebx
cmp $0, %ebx
je et_push_chr
jmp et_push_nr_l

et_m:

movl m, %ebx
cmp $0, %ebx
je et_push_chr
jmp et_push_nr_m

et_n:

movl n, %ebx
cmp $0, %ebx
je et_push_chr
jmp et_push_nr_n

et_o:

movl o, %ebx
cmp $0, %ebx
je et_push_chr
jmp et_push_nr_o

et_p:

movl p, %ebx
cmp $0, %ebx
je et_push_chr
jmp et_push_nr_p

et_q:

movl q, %ebx
cmp $0, %ebx
je et_push_chr
jmp et_push_nr_q

et_r:

movl r, %ebx
cmp $0, %ebx
je et_push_chr
jmp et_push_nr_r

et_s:

movl s, %ebx
cmp $0, %ebx
je et_push_chr
jmp et_push_nr_s

et_t:

movl t, %ebx
cmp $0, %ebx
je et_push_chr
jmp et_push_nr_t

et_u:

movl u, %ebx
cmp $0, %ebx
je et_push_chr
jmp et_push_nr_u

et_v:

movl v, %ebx
cmp $0, %ebx
je et_push_chr
jmp et_push_nr_v

et_w:

movl w, %ebx
cmp $0, %ebx
je et_push_chr
jmp et_push_nr_w

et_x:

movl x, %ebx
cmp $0, %ebx
je et_push_chr
jmp et_push_nr_x

et_y:

movl y, %ebx
cmp $0, %ebx
je et_push_chr
jmp et_push_nr_y

et_z:

movl z, %ebx
cmp $0, %ebx
je et_push_chr
jmp et_push_nr_z

et_push_chr:
xorl %ecx, %ecx
xorl %edx, %edx
movb (%edi, %edx, 1), %cl
pushl %ecx
jmp et_cont_parcurgere

et_push_nr_a:
pushl a
jmp et_cont_parcurgere

et_push_nr_b:
pushl b
jmp et_cont_parcurgere

et_push_nr_c:
pushl c
jmp et_cont_parcurgere

et_push_nr_d:
pushl d
jmp et_cont_parcurgere

et_push_nr_e:
pushl e
jmp et_cont_parcurgere

et_push_nr_f:
pushl f
jmp et_cont_parcurgere

et_push_nr_g:
pushl g
jmp et_cont_parcurgere

et_push_nr_h:
pushl h
jmp et_cont_parcurgere

et_push_nr_i:
pushl i
jmp et_cont_parcurgere

et_push_nr_j:
pushl j
jmp et_cont_parcurgere

et_push_nr_k:
pushl k
jmp et_cont_parcurgere

et_push_nr_l:
pushl l
jmp et_cont_parcurgere

et_push_nr_m:
pushl m
jmp et_cont_parcurgere

et_push_nr_n:
pushl n
jmp et_cont_parcurgere

et_push_nr_o:
pushl o
jmp et_cont_parcurgere

et_push_nr_p:
pushl p
jmp et_cont_parcurgere

et_push_nr_q:
pushl q
jmp et_cont_parcurgere

et_push_nr_r:
pushl r
jmp et_cont_parcurgere

et_push_nr_s:
pushl s
jmp et_cont_parcurgere

et_push_nr_t:
pushl t
jmp et_cont_parcurgere

et_push_nr_u:
pushl u
jmp et_cont_parcurgere

et_push_nr_v:
pushl v
jmp et_cont_parcurgere

et_push_nr_w:
pushl w
jmp et_cont_parcurgere

et_push_nr_x:
pushl x
jmp et_cont_parcurgere

et_push_nr_y:
pushl y
jmp et_cont_parcurgere

et_push_nr_z:
pushl z
jmp et_cont_parcurgere

et_inloc_a:
mov %eax, a
jmp et_cont_parcurgere

et_inloc_b:
mov %eax, b
jmp et_cont_parcurgere

et_inloc_c:
mov %eax, c
jmp et_cont_parcurgere

et_inloc_d:
mov %eax, d
jmp et_cont_parcurgere

et_inloc_e:
mov %eax, e
jmp et_cont_parcurgere

et_inloc_f:
mov %eax, f
jmp et_cont_parcurgere

et_inloc_g:
mov %eax, g
jmp et_cont_parcurgere

et_inloc_h:
mov %eax, h
jmp et_cont_parcurgere

et_inloc_i:
mov %eax, i
jmp et_cont_parcurgere

et_inloc_j:
mov %eax, j
jmp et_cont_parcurgere

et_inloc_k:
mov %eax, k
jmp et_cont_parcurgere

et_inloc_l:
mov %eax, l
jmp et_cont_parcurgere

et_inloc_m:
mov %eax, m
jmp et_cont_parcurgere

et_inloc_n:
mov %eax, n
jmp et_cont_parcurgere

et_inloc_o:
mov %eax, o
jmp et_cont_parcurgere

et_inloc_p:
mov %eax, p
jmp et_cont_parcurgere

et_inloc_q:
mov %eax, q
jmp et_cont_parcurgere

et_inloc_r:
mov %eax, r
jmp et_cont_parcurgere

et_inloc_s:
mov %eax, s
jmp et_cont_parcurgere

et_inloc_t:
mov %eax, t
jmp et_cont_parcurgere

et_inloc_u:
mov %eax, u
jmp et_cont_parcurgere

et_inloc_v:
mov %eax, v
jmp et_cont_parcurgere

et_inloc_w:
mov %eax, w
jmp et_cont_parcurgere

et_inloc_x:
mov %eax, x
jmp et_cont_parcurgere

et_inloc_y:
mov %eax, y
jmp et_cont_parcurgere

et_inloc_z:
mov %eax, z
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
