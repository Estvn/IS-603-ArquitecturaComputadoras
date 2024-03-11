	.text		  @ Zona de instrucciones
main:   mov r0, #250	  @ r0 <- 250
	@add r1, #100  	  @ r1 <- r1 + 100
	add r0, #100	  @ r0 <- r0 + r1
stop:	wfi
