[org 0x7c00]
; Static vars
KERNEL_OFFSET equ 0x1000
STACK_OFFSET equ 0x9000
HELLO_MSG db "Booting Protected mode...", 0
KERNEL_MSG db "Loading Kernel...", 0
DISK_LOAD_MSG db "Disk loaded...", 0
BOOT_DRIVE db 0
 
mov [BOOT_DRIVE], dl
mov bp, STACK_OFFSET
mov sp, bp
mov si, HELLO_MSG
call print_r

  call load_kernel
  call switch_to_pm

  jmp $

%include "boot/print_r.asm"
%include "boot/print_p.asm"
%include "boot/gdt.asm"
%include "boot/protected_mode.asm"
%include "boot/disk_load.asm"


[bits 16]

load_kernel:
  mov si, KERNEL_MSG
  call print_r

  mov bx, KERNEL_OFFSET
  mov dh, 15
  mov dl, [BOOT_DRIVE]
  call disk_load
  
  mov si, DISK_LOAD_MSG
  call print_r

  ret

[bits 32]

PM_ENTRY:  
  call KERNEL_OFFSET

  jmp $

; Bootsector padding
times 510-($-$$) db 0
dw 0xaa55


