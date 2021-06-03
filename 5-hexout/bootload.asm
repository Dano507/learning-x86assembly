[org 0x7c00]            ; indexes will be calculated from this value


; start
mov dx, 0x1fb6
call print_hex

jmp $                   ; hang



print_hex:
    mov cx, dx 
    shr cx, 12
    and cx, 0xf
    call tochar
    mov [HEX_OUT + 2], cl

    mov cx, dx 
    shr cx, 8
    and cx, 0xf
    call tochar
    mov [HEX_OUT + 3], cl

    mov cx, dx 
    shr cx, 4
    and cx, 0xf
    call tochar
    mov [HEX_OUT + 4], cl

    mov cx, dx 
    and cx, 0xf
    call tochar
    mov [HEX_OUT + 5], cl


    mov bx, HEX_OUT
    call print_string
    ret


    tochar:
        cmp cx, 9
        jg ischar

        add cx, '0'
        ret

        ischar:
            add cx, 0x37
            ret
            


%include "printer.asm"          ; import function to print strings


HEX_OUT: db '0x0000', 0


times 510-($-$$) db 0   ; padding or somtething
dw 0xaa55               ; "MaGiC nUmBeRs"

