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

