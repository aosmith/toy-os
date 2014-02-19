message:
  db "Hello World"
push message
call print_string

jmp $

print_string:
  mov ah, 0x0e
  pop bx
  cmp bx, 0x00
  jne print_character
  ret

print_character:
  mov bl, al
  int 0x10
  jmp print_string

times 510-($-$$) db 0

dw 0xaa55
