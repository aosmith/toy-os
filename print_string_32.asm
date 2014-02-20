[bits 32]
VIDEO_MEMORY equ 0xb8000
WHITE_ON_BLACK equ 0x0f

print_string_p:
  pusha
  mov edx, VIDEO_MEMORY

print_string_p_loop:
  mov al, [ebx]
  mov ah, WHITE_ON_BLACK

  cmp al, 0
  je done

  mov [edx], ax

  add ebx, 1
  add edx, 2
  jmp print_string_p_loop

print_string_p_done:
  popa
  ret
