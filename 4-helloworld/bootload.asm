[org 0x7c00]                ; Honestly idk, the book said to do this
mov sp, 0x7c00              ; set stack pointer 
mov bp, 0x7c00              ; set base pointer


; start
pusha                       ; push all registers to stack
mov bx, hello_msg           ; move address of 'hello_msg' into 'bx'
call printf                 ; push return address (address of instruction after this)
                            ; to stack, then jump to printf

mov bx, goodbye_message     ; move address of 'goodbye_message' to 'bx'
call printf
popa                        ; pop all registers from stack


jmp $                       ; infinite jump to self

printf:
    mov ah, 0x0e            ; move output BIOS routine into 'ah' 
    
    loopback:               ; set point to loop back to (for the jump ahead)
    mov al, [bx]            ; move 'bx' AS A POINTER into 'al'
    int 0x10                ; BIOS interrupt (call BIOS)
    add bx, 1               ; add 1 to 'bx'

    cmp al, 0               ; compare 'al' and 0, then set result in some register (idk which)
    jne loopback            ; jump to loopback result if 'cmp' result != 0 
    ret                     ; pop return address then jump to it


hello_msg:                          ; hello world message declaration
    db 'Hello World', 0x0a, 0
goodbye_message:                    ; goodbye world message declaration
    db 'Goodbye World :(', 0x0a, 0


times 510-($-$$) db 0   ; pad the code with null bytes to reach 512 bytes (bootloader filesize)
dw 0xaa55               ; "tells BIOS that previous data is a bootloader"
