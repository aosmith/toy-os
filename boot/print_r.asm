[bits 16]

print_r:
  pusha
  jmp print_r_loop 
print_r_loop:
  cmp byte [si], 0
  je print_r_exit
  mov al, [si]
  mov ah, 0x0e
  int 0x10
  inc si
  jmp print_r_loop

print_r_exit:
  popa
  ret
