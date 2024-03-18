	.data
v:	.byte 2,4,6,3,10,12,2,5

	.text
main:	ldr r0, =v
	mov r1, #0
for:	cmp r1, #8
	beq stop
	ldrb r2, [r0, r1]
	cmp r2, #5
	bge skip
	add r3, #1
skip:	add r1, #1
	b for
stop:	wfi
	.end
