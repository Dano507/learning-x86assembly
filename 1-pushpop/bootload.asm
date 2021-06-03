mov ah, 0x0e            ; int  10/ah = 0eh -> scrolling  teletype  BIOS  routine

mov bp, 0x8000          ; set the stack and base pointer to 0x8000
mov sp, bp 

push 'a'                ; push values C, B and A to the stack
push 'b'
push 'c'

pop bx                  ; pop stack pointer balue to bx
mov al, bl
int 0x10

pop bx                  ; pop stack pointer balue to bx
mov al, bl
int 0x10

mov al, [0x7ffe]        ; move value of 0x7ffe to bx
int 0x10

jmp $                   ; what

times 510-($-$$) db 0   ; padding or somtething
dw 0xaa55               ; botocalre