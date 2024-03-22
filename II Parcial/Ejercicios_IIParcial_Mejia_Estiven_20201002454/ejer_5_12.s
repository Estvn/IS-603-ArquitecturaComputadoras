	.data
v:	.word 3,9
s:	.space 8
apro:	.ascii "aprobado"
susp:	.ascii "suspenso"
	
	.text
main:	ldr r0, =v
	ldr r1, [r0]
	ldr r2, [r0, #4]
	add r3, r1, r2
	lsr r3, r3, #1
	ldr r4, =s

if:	cmp r3, #5
	bge else

	ldr r5, =susp
	ldr r5, [r5]
	ldr r6, [r0, #28]
	str r5, [r4]
	str r6, [r4, #4]
	b stop

else:	ldr r5, =apro
	ldr r5, [r5]
	ldr r6, [r0, #20]
	str r5, [r4]
	str r6, [r4, #4]
	b stop

stop:	wfi
	.end	
