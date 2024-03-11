	.data
ascii:	.ascii "Cada uno de estos caracteres pesa 1 byte"
byte:	.byte 0xFF
word:	.word 0x10203040
	.text
main:		@ Cada caracter abarca 8 bits == 1 byte
stop:	wfi
	.end
