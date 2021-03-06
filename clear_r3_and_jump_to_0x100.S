	/*
	* Clear R3 and jump to address 0x100
	* Bootloader for running applications that are preloaded in memory
	* Clearing R3 is done because Linux uses R3 as a pointer to an
	* external device tree blob if non-zero
	*/

	#Clear r0
	l.movhi r0, 0x000
	#Clear r3
	l.movhi r3, 0x0000
	#Set r4 to 0x100
	l.movhi r4, 0x0000
	l.ori	r4, r0, 0x100
	#Jump to @r4
	l.jr r4
	l.nop
