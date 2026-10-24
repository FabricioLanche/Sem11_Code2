.data
print_fmt:.string "%ld\n" 
.text
.globl main
f:
pushq %rbp
movq %rsp, %rbp
subq $16, %rsp
movq %rdi, -8(%rbp)
movq -8(%rbp), %rax
pushq %rax
movq $2, %rax
movq %rax, %rcx
popq %rax
movq %rax, %rdx
movq $1, %rax
pow_loop_0:
cmpq $0, %rcx
jle pow_end_0
imulq %rdx, %rax
decq %rcx
jmp pow_loop_0
pow_end_0:
pushq %rax
movq $2, %rax
pushq %rax
movq -8(%rbp), %rax
movq %rax, %rcx
popq %rax
imulq %rcx, %rax
movq %rax, %rcx
popq %rax
subq %rcx, %rax
jmp .Lfin_f
movq $0, %rax
.Lfin_f:
leave
ret
g:
pushq %rbp
movq %rsp, %rbp
subq $16, %rsp
movq %rdi, -8(%rbp)
movq $10, %rax
pushq %rax
movq -8(%rbp), %rax
movq %rax, %rcx
popq %rax
subq %rcx, %rax
jmp .Lfin_g
movq $0, %rax
.Lfin_g:
leave
ret
procesar:
pushq %rbp
movq %rsp, %rbp
subq $48, %rsp
movq %rdi, -8(%rbp)
movq $0, -16(%rbp)
movq $0, -24(%rbp)
movq $0, -32(%rbp)
movq $0, -40(%rbp)
movq $0, -48(%rbp)
movq -8(%rbp), %rax
pushq %rax
popq %rdi
call f
movq %rax, -16(%rbp)
movq -8(%rbp), %rax
pushq %rax
popq %rdi
call g
movq %rax, -24(%rbp)
movq -16(%rbp), %rax
pushq %rax
movq -24(%rbp), %rax
movq %rax, %rcx
popq %rax
cmpq %rcx, %rax
jle keep_min_1
movq %rcx, %rax
keep_min_1:
pushq %rax
movq -8(%rbp), %rax
pushq %rax
movq $3, %rax
movq %rax, %rcx
popq %rax
imulq %rcx, %rax
movq %rax, %rcx
popq %rax
cmpq %rcx, %rax
jle keep_min_2
movq %rcx, %rax
keep_min_2:
movq %rax, -32(%rbp)
movq -16(%rbp), %rax
pushq %rax
movq -24(%rbp), %rax
movq %rax, %rcx
popq %rax
cmpq %rcx, %rax
jge keep_max_3
movq %rcx, %rax
keep_max_3:
pushq %rax
movq -8(%rbp), %rax
pushq %rax
movq $3, %rax
movq %rax, %rcx
popq %rax
imulq %rcx, %rax
movq %rax, %rcx
popq %rax
cmpq %rcx, %rax
jge keep_max_4
movq %rcx, %rax
keep_max_4:
movq %rax, -40(%rbp)
movq -32(%rbp), %rax
pushq %rax
movq -16(%rbp), %rax
movq %rax, %rcx
popq %rax
cmpq %rcx, %rax
setle %al
movzbq %al, %rax
pushq %rax
movq -16(%rbp), %rax
pushq %rax
movq -40(%rbp), %rax
movq %rax, %rcx
popq %rax
cmpq %rcx, %rax
setle %al
movzbq %al, %rax
movq %rax, %rcx
popq %rax
addq %rcx, %rax
pushq %rax
movq -32(%rbp), %rax
pushq %rax
movq -24(%rbp), %rax
movq %rax, %rcx
popq %rax
cmpq %rcx, %rax
setle %al
movzbq %al, %rax
movq %rax, %rcx
popq %rax
addq %rcx, %rax
pushq %rax
movq -24(%rbp), %rax
pushq %rax
movq -40(%rbp), %rax
movq %rax, %rcx
popq %rax
cmpq %rcx, %rax
setle %al
movzbq %al, %rax
movq %rax, %rcx
popq %rax
addq %rcx, %rax
movq %rax, -48(%rbp)
movq -32(%rbp), %rax
movq %rax, %rsi
leaq print_fmt(%rip), %rdi
movl $0, %eax
call printf@PLT
movq -40(%rbp), %rax
movq %rax, %rsi
leaq print_fmt(%rip), %rdi
movl $0, %eax
call printf@PLT
movq -48(%rbp), %rax
movq %rax, %rsi
leaq print_fmt(%rip), %rdi
movl $0, %eax
call printf@PLT
movq -40(%rbp), %rax
pushq %rax
movq -32(%rbp), %rax
movq %rax, %rcx
popq %rax
subq %rcx, %rax
jmp .Lfin_procesar
movq $0, %rax
.Lfin_procesar:
leave
ret
main:
pushq %rbp
movq %rsp, %rbp
subq $16, %rsp
movq $0, -8(%rbp)
movq $4, %rax
pushq %rax
popq %rdi
call procesar
movq %rax, -8(%rbp)
movq -8(%rbp), %rax
movq %rax, %rsi
leaq print_fmt(%rip), %rdi
movl $0, %eax
call printf@PLT
movq $0, %rax
jmp .Lfin_main
movq $0, %rax
.Lfin_main:
movq $0, %rax
leave
ret
.section .note.GNU-stack,"",@progbits
