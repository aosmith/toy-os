[org 0x7c00]

  mov si, HELLO_MSG
  call print_r

  mov bp, 0x9000
  mov sp, bp
  call switch_to_pm
  
  jmp $

%include "print/print_r.asm"
%include "print/print_p.asm"
%include "boot/gdt.asm"
%include "boot/protected_mode.asm"

[bits 32]

PM_ENTRY:
  mov ebx, PROTECTED_MODE_MSG
  call print_p
  jmp $

PROTECTED_MODE_MSG db "Loaded protected mode.", 0
HELLO_MSG db "Booting Protected mode...", 0

; Bootsector padding
times 510-($-$$) db 0
dw 0xaa55


