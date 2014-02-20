[org 0x7c00]

mov si, HELLO_MSG

call print_string

mov si, LAUNCH_MSG

exit:
; Switch to 32-bit protected mode.
lgdt [gdt_descriptor]
mov eas, cr0
or eax, 0x1
mov cr0, eax
; Now we're in protected mode.

; Clearing the pipeline
jmp CODE_SEG:protected_mode_entry


%include "print_string.asm"
%include "boot/gdt.asm"
; Data
HELLO_MSG:
  db 'Bootstrapping... \n', 0

LAUNCH_MSG:
  db 'Loading second stage. \n', 0

times 510-($-$$) db 0
dw 0xaa55


[bits 32]

protected_mode_entry:
jmp $
