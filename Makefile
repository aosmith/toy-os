# Default make target .

run: all
	bochs

all: combine

BarrelRoll: clean run

combine: boot.bin kernel.bin
	cat boot.bin kernel.bin > toy-os.img

clean:
	rm *.bin *.o

# Link
kernel.bin: kernel_entry.o kernel.o
	ld -m elf_i386 -o kernel.bin -Ttext 0x1000 $^ --oformat binary

# Compile Kernel
kernel.o: kernel.c
	gcc -m32 -ffreestanding -c $< -o $@

# Kernel Entry ensures proper linking of the boot sector and kernel
kernel_entry.o: kernel_entry.asm
	nasm $^ -f elf -o kernel_entry.o

# Compile boot sector
boot.bin: boot.asm
	nasm $^ -f bin -o $@
