	.data
v:	.hword 10,20,25,500,3

	.text
main:	ldrh r0, =v
	ldrh r1, [r0, #2]
	ldrh r2, [r0, #4]
	ldrh r3, [r0, #6]
	ldrh r4, [r0, #8]
	ldrh r0, [r0]
	wfi
