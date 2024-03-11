	.text
main:	ldr r0, =#0xF0F0
	ldr r1, =#0x0040
	eor r0, r1
stop:	wfi
	.end
