	.data
v:	.word 8,8
s:	.space 16
apro:	.asciz "aprobado"
susp:	.asciz "suspenso"
not:	.asciz "notable"
sobre:	.asciz "sobresaliente"
    
	.text
main:	ldr r0, =v
    	ldr r1, [r0]
    	ldr r2, [r0, #4]
    	add r3, r1, r2
    	lsr r3, r3, #1 @ En r3 está almacenado la media de las dos notas.
    	ldr r4, =s

if:	cmp r3, #5
	blt susp2
	cmp r3, #5
	bge apro2
nota:	cmp r3, #7
	bge nota2

susp2:	ldr r5, =susp
	b ciclo

apro2:	cmp r3, #7
	bge nota
	ldr r5, =apro
	b ciclo

nota2:	cmp r3, #9
	bge sobre2
	ldr r5, =not
	b ciclo

sobre2: ldr r5, =sobre
	b ciclo

ciclo:	mov r6, #0
while:	ldrb r7, [r5, r6]
	cmp r7, #0
	beq stop
	strb r7, [r4, r6]
	add r6, #1
	b while

stop:	wfi
    	.end
