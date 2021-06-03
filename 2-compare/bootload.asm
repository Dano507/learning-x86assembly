mov bx, 30

cmp bx, 4
jle funca

cmp bx, 40
jl funcb

jmp funcc


funca:
    mov ah, 0x0e
    mov al, 'A'
    jmp write

funcb:
    mov ah, 0x0e
    mov al, 'B'
    jmp write

funcc:
    mov ah, 0x0e
    mov al, 'C'
    jmp write

write:
    mov ah, 0x0e
    int 0x10

jmp $

times 510-($-$$) db 0   ; padding or somtething
dw 0xaa55               ; "MaGiC nUmBeRs"