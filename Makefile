# Default make target .

C_SOURCES = $(wildcard kernel/*.c)
HEADERS = $(wildcard kernel/*.h)

OBJ = ${C_SOURCES:.c=.o}

run: all
	bochs && make

all: image

reset: clean run

image: boot/boot.bin kernel.bin
	cat $^ > toy-os.bin

clean:
	rm -f *.bin *.o toy-os.img kernel/*.o boot/*.bin

# Link
kernel.bin: boot/kernel_entry.o ${OBJ} drivers/screen.o
	ld -m elf_i386 -o $@ -Ttext 0x1000 $^ --oformat binary

# Compile .c sources into object files
%.o: %.c
	gcc -m32 -ffreestanding -c $< -o $@

# Compile .asm sources into object files
%.o: %.asm
	nasm $< -f elf -o $@

%.bin: %.asm
	nasm $< -f bin -o $@
