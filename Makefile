# Default make target .

run: all
	bochs

all: combine

combine: boot.bin kernel.bin
	cat boot.bin kernel.bin > toy-os.img

clean:
	rm *.bin *.o

# # $ ^ is substituted with all of the target ’ s dependancy files
kernel.bin: kernel.o
	ld -o kernel.bin -Ttext 0x1000 $^ --oformat binary

# # $ < is the first dependancy and $@ is the target file
kernel.o: kernel.c
	gcc -ffreestanding -c $< -o $@

boot.bin: boot.asm
	nasm $< -f bin -o $@

# # Same as the above rule .
# kernel_entry.o: kernel_entry.asm
# 	nasm $ < -f elf -o $@
