	.data
word:	.word 0x3
byte1:	.byte 0x10
	.balign 4
	.space 4
byte2:	.byte 0x14 @ 20 --> 0001 0100

	.text
stop:	wfi
	.end
