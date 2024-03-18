	.data
v:	.byte 10, 20
space:	.space 1
	.text
main:	ldrb r0, =v
	ldrb r1, [r0, #1]
	ldrb r0, [r0]
	add r0, r1
	ldrb r1, =space
	strb r0, [r1]
	
stop:	wfi
	.end
