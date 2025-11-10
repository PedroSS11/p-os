qemu-system-x86_64 -drive format=raw,file=boot.bin -s -S & gdb -ex "target remote localhost:1234"
