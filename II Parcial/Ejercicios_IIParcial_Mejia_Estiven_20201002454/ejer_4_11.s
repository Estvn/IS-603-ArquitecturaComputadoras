	.data
word1:	.word 0x10203040
word2:	.word 0x11213141
word3:	.word 0x12223242

	.text
main:	ldr r0, =word1
	ldr r1, =word2
	ldr r2, =word3
	wfi
