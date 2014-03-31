# quick makefile for building test app

TOOLCHAIN=arm-none-eabi
GCC=$(TOOLCHAIN)-gcc
LD=$(TOOLCHAIN)-ld
OBJ-COPY=$(TOOLCHAIN)-objcopy

all: objcopy

objcopy: link
	$(OBJ-COPY) -Obinary main.elf main.bin

link: build
	$(LD) -Tstm32.ld -nostartfiles -o main.elf *.o

build:
	$(GCC) -I. -c -fno-common -O0 -g -mcpu=cortex-m3 -mthumb *.c

clean:
	rm *.o
	rm *.elf
	rm *.bin