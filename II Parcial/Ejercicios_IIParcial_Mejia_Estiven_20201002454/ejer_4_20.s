	.data
v:	.byte 10,20,25
	.balign 2
	.hword 500
	.byte 3

	.text
main:	ldr r0, =v
	mov r1, #6
	mov r2, #0

for:	cmp r2, #3
	beq next
	ldrb r3, [r0, r2]
	add r3, #5
	add r2, #1
	add r1, #1
	strb r3, [r0, r1]
	b for

next:	ldrh r1, [r0, #4]
	add r1, #5
	strh r1, [r0, #10]
	ldrb r1, [r0, #6]
	add r1, #5
	strb r1, [r0, #12]
stop:	wfi
	.end
