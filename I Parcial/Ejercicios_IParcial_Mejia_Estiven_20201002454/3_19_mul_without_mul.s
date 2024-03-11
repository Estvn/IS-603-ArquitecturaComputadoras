	.text
main:	mov r0, #0x00000001
	lsl r0, #5

stop:	wfi
	.end
