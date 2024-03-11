	.data
	.word 0xDDFFAABB
	.byte 0x12
	.align 2
	.word 0x45568899

	.text
stop:	wfi
	.end
