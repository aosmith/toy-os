[org 0x7c00]

; Save boot drive
mov [BOOT_DRIVE], dl

; Setup stack
mov bp, STACK_OFFSET
mov sp, bp

; Say hi
mov si, HELLO_MSG
call print_r

; And away we go...
call load_kernel
call switch_to_pm

jmp $

; Static vars
KERNEL_OFFSET equ 0x1000
STACK_OFFSET equ 0x9000
SECTORS_TO_LOAD equ 15
HELLO_MSG db "Booting Protected mode...", 0
KERNEL_MSG db "Loading Kernel...", 0
DISK_LOAD_MSG db "Disk loaded...", 0
BOOT_DRIVE db 0

; Includes
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
  mov dh, SECTORS_TO_LOAD
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


