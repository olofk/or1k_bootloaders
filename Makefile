TARGETS := $(patsubst %.S,%.vh,$(wildcard *.S))

all: $(TARGETS)

%.elf: %.S
	or1k-elf-gcc -nostdlib $< -o $@

%.bin: %.elf
	or1k-elf-objcopy -O binary $< $@

%.vh: %.bin
	python wb_rom_gen.py $< > $@


clean:
	rm $(TARGETS)
