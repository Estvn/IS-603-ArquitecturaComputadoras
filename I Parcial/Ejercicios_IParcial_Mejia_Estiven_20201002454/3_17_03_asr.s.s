.text			@ Zona de instrucciones
main:	ldr r0, =0xffffff41	@ r0 <- 0xffffff41
	mov r1, #3		@ r1 <- 4
	lsr r0, r1		@ r0 <- r0 >>a 4
stop:	wfi
