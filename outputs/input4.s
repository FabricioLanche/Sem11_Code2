.data
print_fmt:.string "%ld\n" 
.text
.globl main
find_min_recursive:
pushq %rbp
movq %rsp, %rbp
subq $32, %rsp
movq %rdi, -8(%rbp)
movq %rsi, -16(%rbp)
movq $0, -24(%rbp)
movq -8(%rbp), %rax
pushq %rax
movq $0, %rax
movq %rax, %rcx
popq %rax
cmpq %rcx, %rax
setle %al
movzbq %al, %rax
cmpq $0, %rax
je else_0
movq -16(%rbp), %rax
jmp .Lfin_find_min_recursive
jmp endif_0
else_0:
endif_0:
movq -8(%rbp), %rax
pushq %rax
movq -8(%rbp), %rax
movq %rax, %rcx
popq %rax
imulq %rcx, %rax
pushq %rax
movq $6, %rax
pushq %rax
movq -8(%rbp), %rax
movq %rax, %rcx
popq %rax
imulq %rcx, %rax
movq %rax, %rcx
popq %rax
subq %rcx, %rax
pushq %rax
movq $5, %rax
movq %rax, %rcx
popq %rax
addq %rcx, %rax
movq %rax, -24(%rbp)
movq -8(%rbp), %rax
pushq %rax
movq $1, %rax
movq %rax, %rcx
popq %rax
subq %rcx, %rax
pushq %rax
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
popq %rsi
popq %rdi
call find_min_recursive
jmp .Lfin_find_min_recursive
movq $0, %rax
.Lfin_find_min_recursive:
leave
ret
find_max_recursive:
pushq %rbp
movq %rsp, %rbp
subq $32, %rsp
movq %rdi, -8(%rbp)
movq %rsi, -16(%rbp)
movq $0, -24(%rbp)
movq -8(%rbp), %rax
pushq %rax
movq $0, %rax
movq %rax, %rcx
popq %rax
cmpq %rcx, %rax
setle %al
movzbq %al, %rax
cmpq $0, %rax
je else_2
movq -16(%rbp), %rax
jmp .Lfin_find_max_recursive
jmp endif_2
else_2:
endif_2:
movq -8(%rbp), %rax
pushq %rax
movq -8(%rbp), %rax
movq %rax, %rcx
popq %rax
imulq %rcx, %rax
pushq %rax
movq $6, %rax
pushq %rax
movq -8(%rbp), %rax
movq %rax, %rcx
popq %rax
imulq %rcx, %rax
movq %rax, %rcx
popq %rax
subq %rcx, %rax
pushq %rax
movq $5, %rax
movq %rax, %rcx
popq %rax
addq %rcx, %rax
movq %rax, -24(%rbp)
movq -8(%rbp), %rax
pushq %rax
movq $1, %rax
movq %rax, %rcx
popq %rax
subq %rcx, %rax
pushq %rax
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
popq %rsi
popq %rdi
call find_max_recursive
jmp .Lfin_find_max_recursive
movq $0, %rax
.Lfin_find_max_recursive:
leave
ret
main:
pushq %rbp
movq %rsp, %rbp
subq $16, %rsp
movq $0, -8(%rbp)
movq $0, -16(%rbp)
movq $6, %rax
pushq %rax
movq $1000, %rax
pushq %rax
popq %rsi
popq %rdi
call find_min_recursive
movq %rax, -8(%rbp)
movq $6, %rax
pushq %rax
movq $0, %rax
pushq %rax
movq $1000, %rax
movq %rax, %rcx
popq %rax
subq %rcx, %rax
pushq %rax
popq %rsi
popq %rdi
call find_max_recursive
movq %rax, -16(%rbp)
movq -8(%rbp), %rax
movq %rax, %rsi
leaq print_fmt(%rip), %rdi
movl $0, %eax
call printf@PLT
movq -16(%rbp), %rax
movq %rax, %rsi
leaq print_fmt(%rip), %rdi
movl $0, %eax
call printf@PLT
movq -16(%rbp), %rax
pushq %rax
movq -8(%rbp), %rax
movq %rax, %rcx
popq %rax
subq %rcx, %rax
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
