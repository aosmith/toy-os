#include "kernel.h"
#include "../drivers/screen.h"

void main() {
  char* video_memory = (char *) 0xb8000;
  char attr = false;
  *video_memory = 'X';
  print_char('A', attr, 0, 0);
  print_char('l', attr, 1, 0);
  print_string("Alex Smith", 1);
  return;
}
