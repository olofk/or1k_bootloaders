	/*
	* Infinite boot loop
	* An infinite loop implemented with a jump to itself.
	* Useful to prevent the PC from running wild in the memory if an
	* application is loaded by some other method, e.g. through the debug
	* interface */
	l.j 0
	l.nop
	
