Trouble with this project:
	I had to move a 16-bit memory address into an 8-bit register
	which really confused me ( { mov al, [bx] } on line 23 )


NOTES:
 'call' behaves like 'jmp', but pushes the "return address"
 (address of the function caller?) onto the stack

 'ret' pops the "return address" off the stack, then 
 jumps to it


 'pusha' and 'popa' will, respectively, push all registers 
 or pop all registers