print_string:
  pusha
  jmp print_string_loop 
print_string_loop:
  cmp byte [si], 0
  je print_string_exit
  mov al, [si]
  mov ah, 0x0e
  int 0x10
  inc si
  jmp print_string_loop

print_string_exit:
  popa
  ret

print_hex:
  pusha
  
  popa
  ret

HEX_OUT:
  db '0x0000', 0
