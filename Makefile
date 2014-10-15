# Default make target .

run: all
	bochs

all: combine

BarrelRoll: clean run

combine: boot.bin kernel.bin
	cat boot.bin kernel.bin > toy-os.img

clean:
	rm *.bin *.o

# # $ ^ is substituted with all of the target ’ s dependancy files
kernel.bin: kernel_entry.o kernel.o
	ld -m elf_i386 -o kernel.bin -Ttext 0x1000 $^ --oformat binary

# # $ < is the first dependancy and $@ is the target file
kernel.o: kernel.c
	gcc -m32 -ffreestanding -c $< -o $@

kernel_entry.o: kernel_entry.asm
	nasm $< -f elf -o kernel_entry.o

boot.bin: boot.asm
	nasm $< -f bin -o $@

# # Same as the above rule .
# kernel_entry.o: kernel_entry.asm
# 	nasm $ < -f elf -o $@
