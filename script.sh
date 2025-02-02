# IR
koopac hello.koopa | llc --filetype=obj -o hello.o
clang hello.o -L$CDE_LIBRARY_PATH/native -lsysy -o hello

# RISCV
clang hello.S -c -o hello.o -target riscv32-unknown-linux-elf -march=rv32im -mabi=ilp32
ld.lld hello.o -L$CDE_LIBRARY_PATH/riscv32 -lsysy -o hello
qemu-riscv32-static hello