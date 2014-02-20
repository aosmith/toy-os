[org 0x7c00]
  mov bx, HELLO_MSG
  call_print:
    call print_string
  cmp [bx], 0
  jne call_print
  jmp $

print_string:
  pusha
  mov ah, 0x0e
  mov al, [bx]
  popa
  add bx, 1
  ret

; Data
HELLO_MSG:
  db 'Hello, World!', 0

times 510-($-$$) db 0
dw 0xaa55
