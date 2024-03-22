	.data
mem:	.byte 0

	.text
main:	mov r1, #1
	mov r2, #1
	mov r3, #0
cont:	mov r4, #0

for:	cmp r4, #10
	beq stop

	ldrb r5, =mem
	strb r1, [r5, r4]
	add r1, r2, r3
	mov r3, r2
	mov r2, r1
	add r4, #1
	b for

stop:	wfi
