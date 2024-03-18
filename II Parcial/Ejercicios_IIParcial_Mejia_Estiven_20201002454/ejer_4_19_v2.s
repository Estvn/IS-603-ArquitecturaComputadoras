	.data
v:	.byte 10,20,25
	.balign 2
	.hword 500
	.byte 3	

	.text
main:	ldr r0, =v
	ldrb r1, [r0, #1]
	ldrb r2, [r0, #2]
	ldrh r3, [r0, #4]
	ldrb r4, [r0, #6]
	ldrb r0, [r0]
	wfi
