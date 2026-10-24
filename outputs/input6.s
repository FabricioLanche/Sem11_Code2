.data
print_fmt:.string "%ld\n" 
.text
.globl main
rango:
pushq %rbp
movq %rsp, %rbp
subq $32, %rsp
movq %rdi, -8(%rbp)
movq %rsi, -16(%rbp)
movq %rdx, -24(%rbp)
movq %rcx, -32(%rbp)
movq -8(%rbp), %rax
pushq %rax
movq -16(%rbp), %rax
movq %rax, %rcx
popq %rax
cmpq %rcx, %rax
jge keep_max_0
movq %rcx, %rax
keep_max_0:
pushq %rax
movq -24(%rbp), %rax
movq %rax, %rcx
popq %rax
cmpq %rcx, %rax
jge keep_max_1
movq %rcx, %rax
keep_max_1:
pushq %rax
movq -32(%rbp), %rax
movq %rax, %rcx
popq %rax
cmpq %rcx, %rax
jge keep_max_2
movq %rcx, %rax
keep_max_2:
pushq %rax
movq -8(%rbp), %rax
pushq %rax
movq -16(%rbp), %rax
movq %rax, %rcx
popq %rax
cmpq %rcx, %rax
jle keep_min_3
movq %rcx, %rax
keep_min_3:
pushq %rax
movq -24(%rbp), %rax
movq %rax, %rcx
popq %rax
cmpq %rcx, %rax
jle keep_min_4
movq %rcx, %rax
keep_min_4:
pushq %rax
movq -32(%rbp), %rax
movq %rax, %rcx
popq %rax
cmpq %rcx, %rax
jle keep_min_5
movq %rcx, %rax
keep_min_5:
movq %rax, %rcx
popq %rax
subq %rcx, %rax
jmp .Lfin_rango
movq $0, %rax
.Lfin_rango:
leave
ret
contar_en_rango:
pushq %rbp
movq %rsp, %rbp
subq $48, %rsp
movq %rdi, -8(%rbp)
movq %rsi, -16(%rbp)
movq %rdx, -24(%rbp)
movq %rcx, -32(%rbp)
movq %r8, -40(%rbp)
movq %r9, -48(%rbp)
movq -40(%rbp), %rax
pushq %rax
movq -8(%rbp), %rax
movq %rax, %rcx
popq %rax
cmpq %rcx, %rax
setle %al
movzbq %al, %rax
pushq %rax
movq -8(%rbp), %rax
pushq %rax
movq -48(%rbp), %rax
movq %rax, %rcx
popq %rax
cmpq %rcx, %rax
setle %al
movzbq %al, %rax
movq %rax, %rcx
popq %rax
addq %rcx, %rax
pushq %rax
movq -40(%rbp), %rax
pushq %rax
movq -16(%rbp), %rax
movq %rax, %rcx
popq %rax
cmpq %rcx, %rax
setle %al
movzbq %al, %rax
movq %rax, %rcx
popq %rax
addq %rcx, %rax
pushq %rax
movq -16(%rbp), %rax
pushq %rax
movq -48(%rbp), %rax
movq %rax, %rcx
popq %rax
cmpq %rcx, %rax
setle %al
movzbq %al, %rax
movq %rax, %rcx
popq %rax
addq %rcx, %rax
pushq %rax
movq -40(%rbp), %rax
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
movq -48(%rbp), %rax
movq %rax, %rcx
popq %rax
cmpq %rcx, %rax
setle %al
movzbq %al, %rax
movq %rax, %rcx
popq %rax
addq %rcx, %rax
pushq %rax
movq -40(%rbp), %rax
pushq %rax
movq -32(%rbp), %rax
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
movq -48(%rbp), %rax
movq %rax, %rcx
popq %rax
cmpq %rcx, %rax
setle %al
movzbq %al, %rax
movq %rax, %rcx
popq %rax
addq %rcx, %rax
jmp .Lfin_contar_en_rango
movq $0, %rax
.Lfin_contar_en_rango:
leave
ret
main:
pushq %rbp
movq %rsp, %rbp
subq $16, %rsp
movq $0, -8(%rbp)
movq $0, -16(%rbp)
movq $12, %rax
pushq %rax
movq $45, %rax
pushq %rax
movq $8, %rax
pushq %rax
movq $30, %rax
pushq %rax
popq %rcx
popq %rdx
popq %rsi
popq %rdi
call rango
movq %rax, -8(%rbp)
movq -8(%rbp), %rax
movq %rax, %rsi
leaq print_fmt(%rip), %rdi
movl $0, %eax
call printf@PLT
movq $12, %rax
pushq %rax
movq $45, %rax
pushq %rax
movq $8, %rax
pushq %rax
movq $30, %rax
pushq %rax
movq $10, %rax
pushq %rax
movq $35, %rax
pushq %rax
popq %r9
popq %r8
popq %rcx
popq %rdx
popq %rsi
popq %rdi
call contar_en_rango
movq %rax, -16(%rbp)
movq -16(%rbp), %rax
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
