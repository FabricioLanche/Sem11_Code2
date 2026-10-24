.data
print_fmt:.string "%ld\n" 
.text
.globl main
contar_condiciones:
pushq %rbp
movq %rsp, %rbp
subq $16, %rsp
movq %rdi, -8(%rbp)
movq $0, -16(%rbp)
movq -8(%rbp), %rax
pushq %rax
movq $10, %rax
movq %rax, %rcx
popq %rax
cmpq %rcx, %rax
setle %al
movzbq %al, %rax
pushq %rax
movq $7, %rax
pushq %rax
movq -8(%rbp), %rax
movq %rax, %rcx
popq %rax
cmpq %rcx, %rax
setle %al
movzbq %al, %rax
movq %rax, %rcx
popq %rax
addq %rcx, %rax
pushq %rax
movq $1, %rax
movq %rax, %rcx
popq %rax
addq %rcx, %rax
pushq %rax
movq $2, %rax
pushq %rax
movq -8(%rbp), %rax
movq %rax, %rcx
popq %rax
imulq %rcx, %rax
pushq %rax
movq $8, %rax
movq %rax, %rcx
popq %rax
cmpq %rcx, %rax
setle %al
movzbq %al, %rax
movq %rax, %rcx
popq %rax
addq %rcx, %rax
movq %rax, -16(%rbp)
movq -16(%rbp), %rax
jmp .Lfin_contar_condiciones
movq $0, %rax
.Lfin_contar_condiciones:
leave
ret
calcular_extremos:
pushq %rbp
movq %rsp, %rbp
subq $16, %rsp
movq %rdi, -8(%rbp)
movq %rsi, -16(%rbp)
movq -16(%rbp), %rax
cmpq $0, %rax
je else_0
movq -8(%rbp), %rax
pushq %rax
movq $3, %rax
movq %rax, %rcx
popq %rax
imulq %rcx, %rax
pushq %rax
movq $15, %rax
pushq %rax
movq -8(%rbp), %rax
movq %rax, %rcx
popq %rax
subq %rcx, %rax
movq %rax, %rcx
popq %rax
cmpq %rcx, %rax
jle keep_min_1
movq %rcx, %rax
keep_min_1:
pushq %rax
movq $0, %rax
pushq %rax
movq -8(%rbp), %rax
movq %rax, %rcx
popq %rax
subq %rcx, %rax
movq %rax, %rcx
popq %rax
cmpq %rcx, %rax
jle keep_min_2
movq %rcx, %rax
keep_min_2:
pushq %rax
movq -8(%rbp), %rax
pushq %rax
movq $2, %rax
movq %rax, %rcx
popq %rax
movq %rax, %rdx
movq $1, %rax
pow_loop_4:
cmpq $0, %rcx
jle pow_end_4
imulq %rdx, %rax
decq %rcx
jmp pow_loop_4
pow_end_4:
movq %rax, %rcx
popq %rax
cmpq %rcx, %rax
jle keep_min_3
movq %rcx, %rax
keep_min_3:
jmp .Lfin_calcular_extremos
jmp endif_0
else_0:
movq -8(%rbp), %rax
pushq %rax
movq $3, %rax
movq %rax, %rcx
popq %rax
imulq %rcx, %rax
pushq %rax
movq $15, %rax
pushq %rax
movq -8(%rbp), %rax
movq %rax, %rcx
popq %rax
subq %rcx, %rax
movq %rax, %rcx
popq %rax
cmpq %rcx, %rax
jge keep_max_5
movq %rcx, %rax
keep_max_5:
pushq %rax
movq $0, %rax
pushq %rax
movq -8(%rbp), %rax
movq %rax, %rcx
popq %rax
subq %rcx, %rax
movq %rax, %rcx
popq %rax
cmpq %rcx, %rax
jge keep_max_6
movq %rcx, %rax
keep_max_6:
pushq %rax
movq -8(%rbp), %rax
pushq %rax
movq $2, %rax
movq %rax, %rcx
popq %rax
movq %rax, %rdx
movq $1, %rax
pow_loop_8:
cmpq $0, %rcx
jle pow_end_8
imulq %rdx, %rax
decq %rcx
jmp pow_loop_8
pow_end_8:
movq %rax, %rcx
popq %rax
cmpq %rcx, %rax
jge keep_max_7
movq %rcx, %rax
keep_max_7:
jmp .Lfin_calcular_extremos
endif_0:
movq $0, %rax
.Lfin_calcular_extremos:
leave
ret
main:
pushq %rbp
movq %rsp, %rbp
subq $32, %rsp
movq $0, -8(%rbp)
movq $0, -16(%rbp)
movq $0, -24(%rbp)
movq $0, -32(%rbp)
movq $4, %rax
movq %rax, -8(%rbp)
movq -8(%rbp), %rax
pushq %rax
popq %rdi
call contar_condiciones
movq %rax, -16(%rbp)
movq -8(%rbp), %rax
pushq %rax
movq $1, %rax
pushq %rax
popq %rsi
popq %rdi
call calcular_extremos
movq %rax, -24(%rbp)
movq -8(%rbp), %rax
pushq %rax
movq $0, %rax
pushq %rax
popq %rsi
popq %rdi
call calcular_extremos
movq %rax, -32(%rbp)
movq -16(%rbp), %rax
movq %rax, %rsi
leaq print_fmt(%rip), %rdi
movl $0, %eax
call printf@PLT
movq -24(%rbp), %rax
movq %rax, %rsi
leaq print_fmt(%rip), %rdi
movl $0, %eax
call printf@PLT
movq -32(%rbp), %rax
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
