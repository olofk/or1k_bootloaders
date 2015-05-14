RESET_VECTOR ?= 0x100
OFFSET ?= 0x0
TARGETS := $(patsubst %.S,%.vh,$(wildcard *.S))

all: $(TARGETS)

%.elf: %.S
	or1k-elf-gcc -nostdlib $< -o $@

%.bin: %.elf
	or1k-elf-objcopy -O binary $< $@

%.vh: %.bin
	./bin2vh $< > $@

%.ub: %.bin
	mkimage \
	-A or1k \
	-C none \
	-T standalone \
	-a $(OFFSET) \
	-e $(RESET_VECTOR) \
	-n '$@' \
	-d $< \
	$@

%.hex: %.ub
	or1k-elf-objcopy -I binary -O ihex $< $@
clean:
	rm $(TARGETS)
