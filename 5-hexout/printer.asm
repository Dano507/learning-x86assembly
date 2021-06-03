print_string:       ; Function to print string
    mov ah, 0x0e            
    
    loopback:
    mov al, [bx]
    int 0x10
    add bx, 1

    cmp al, 0
    jne loopback
    ret
