	.data
v:	.byte 0x10, 0x20, 0x30, 0x40
w:	.space 4

	.text
main:	ldr r0, =v
	ldr r0, [r0]
	ldr r1, =w
	str r0, [r1]
stop:	wfi
	.end
