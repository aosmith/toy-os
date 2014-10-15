toy-os
======
This is a toy operating system.  Right now it sets up the gdt and switches from real to protected mode.

Building:
---------
```nasm -f bin -o boot.bin```

Running:
--------
I've been using bochs to run my binaries (as a floppy drive). Your boschsrc should look something like this:

```
floppya: 1_44=~/Development/toy-os/boot.bin, status=inserted
boot: a
```

Right now this boots to protected mode and runs main from `kernel.c`.  This just prints an X at the top right corner.

Useful commands:
----------------
Build:
```make all```

Run:
```make run```

Clean:
```make clean```

BarrelRoll:
```make reset``

Compiles basic.c to basic.o in freestanding mode:
```gcc -ffreestanding -c basic.c -o basic.o```

Dump an object file:
```objdump -d basic.o```

Links to binary file for execution:
```ld -o basic.bin -Ttext 0x0 --oformat binary basic.o```


Dissassemble Binary:
```nadisasm -b 32 basic.bin > basic.dis```


