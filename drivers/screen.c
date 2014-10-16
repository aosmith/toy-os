#include "screen.h"
#include "../kernel/kernel.h"


static short rows = 0;
static short cols = 0;

void print_char(char pchar, char attr, char col, char row) {
  unsigned char *video_memory = (unsigned char *) VIDEO_ADDRESS;

  if (!attr) {
    attr = WHITE_ON_BLACK;
  }

  int offset;

  if (col >= 0 && row >= 0) {
    offset = get_offset(col, row);
  } else {
    //offset = get_cursor();
    offset = 0;
  }
  if (pchar == '\n') {
    int rows = offset / (2 * ROW_WIDTH);
    offset = get_offset(79,rows);
  } else {
    video_memory[offset] = pchar;
    video_memory[offset+1] = attr;
  }

  offset += 2;
  //offset = handle_scrolling(offset);
}

void print_string(char *string, int row) {
  char cursor = 0;
  while (*string != 0x00) {
    print_char(*string, false, cursor, row);
    cursor++;
    string++;
  }
}


int get_offset(char column, char row) {
  int offset = ((row * ROW_WIDTH) + column) * 2;
  return offset;
}
