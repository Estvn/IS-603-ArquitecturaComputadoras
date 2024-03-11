	.text			@ Zona de instrucciones
main:	ldr r0, =0x12345678	@ r0 <- 0x1234 5678
	ldr r1, =0x00000F00	@ r1 <- 0x0000 0F00
	and r0, r1		@ r0 <- r0 AND r1
stop:	wfi
