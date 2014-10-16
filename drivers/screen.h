#define VIDEO_ADDRESS 0xb8000
#define MAX_ROWS 25
#define ROW_WIDTH 80
#define WHITE_ON_BLACK 0x0f
#define REG_ SCREEN_ CTRL 0x3D4
#define REG_ SCREEN_DATA 0x3D5

int get_offset(char column, char row);
int get_cursor();

void set_cursor(char column, char row);
void print_char(char pchar, char attr, char col, char row);
void print_string(char *string, int row);
