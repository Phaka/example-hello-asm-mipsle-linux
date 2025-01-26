# MIPSLE assembly for Linux
# System calls for MIPS Linux:
# 4004 for write
# 4001 for exit
    .section .rodata
    .align 2
message:
    .ascii "Hello, World!\n"
    .set message_len, .-message

    .text
    .align 2
    .global _start
    .ent _start
_start:
    # Write system call
    li $v0, 4004        # write system call number
    li $a0, 1           # file descriptor 1 is stdout
    la $a1, message     # address of message
    li $a2, message_len # length of message
    syscall             # make system call

    # Exit system call
    li $v0, 4001        # exit system call number
    li $a0, 0           # return code 0
    syscall             # make system call

    .end _start
