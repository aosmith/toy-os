[org 0x7c00]

mov si, HELLO_MSG

call print_string

mov si, LAUNCH_MSG

exit:
jmp $

%include "print_string.asm"
; Data
HELLO_MSG:
  db 'Bootstrapping... \n', 0

LAUNCH_MSG:
  db 'Loading second stage. \n', 0

times 510-($-$$) db 0
dw 0xaa55
