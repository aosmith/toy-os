mov bx, 41

cmp bx, 4
jle a_block
cmp bx, 40
jl b_block
jmp c_block

a_block:
  mov al, 'A'
  jmp end
b_block:
  mov al, 'B'
  jmp end
c_block:
  mov al, 'C'

end:
  mov ah, 0x0e
  int 0x10
  jmp $
;if (bx <= 4) {
;  mov al, 'A'
;} else if(bx < 40) {
;  mov al, 'B'
;} else {
;  mov al, 'C'
;}

times 510-($-$$) db 0
dw 0xaa55
