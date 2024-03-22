	.data
cadena1: .asciz "Holaaaaaaa mundo"
cadena2: .asciz "Hola mundo"
res: .space 2

	.text
main: ldr r0, =cadena1
      ldrb r1, [r0]
	bl contar
	mov r4, r3 @ cant caracteres cadena1
	
	mov r3, #0
	ldr r0, =cadena2
	ldrb r1, [r0]
	bl contar
	mov r5, r3 @ cant caract cadena2

@******************* 
	ldr r0, =res
	cmp r4, r5
	bgt cumple @ si r4>r5, almac 1, sino, 2
	mov r6, #2
	b salto

cumple:	mov r6, #1

salto:	strh r6, [r0]
stop: wfi

contar: cmp r1, #0 @ si no es fin de cadena, continuar
	beq salir
	add r3, r3, #1 @ cant caracteres 
next:	add r0, r0, #1 @ dir de memoria siguiente caracter
	ldrb r1, [r0] @ leer siguiente caracter
	b contar	
salir:	mov pc, lr
