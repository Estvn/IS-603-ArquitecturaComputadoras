	.data
v: .byte 5, 3, 8, 5, 6, 8, 10, 4, 8, 7, 5, 7

	.text
	mov r7, #1
	mov r1, #7
inicio:	mov r0, #0
	ldr r2, =v
	mov r4, #0
	mov r5, #0
	bl igualque

igualque: ldrb r3, [r2, r4]
	  add r0, r0, #1
	  cmp r1, r3
	  beq suma
	  add r4, r4, #1
	  cmp r0, #12
	  beq repeat
	  mov pc, lr

suma:	add r5, r5, #1
	add r4, r4, #1
	mov pc, lr

repeat: cmp r7,#2
	beq resultado
	mov r7, #2
	mov r6, r5
	mov r1, #8
	b inicio

resultado: add r1, r6, r5
stop:	wfi
	.end


@	.data
@v: 5, 3, 5, 5, 8, 12, 12, 15, 12

@	.text
@	mov r7, #1
@	mov r1, #7
@inicio:	mov r0, #0
@	ldr r2, =v
@	mov r4, #0
@	mov r5, #0
@	bl menorque
@
@menorque: ldrb r3, [r2, r4]
@	  add r0, r0, #1
@	  cmp r3. #5
@	  bge suma
@	  add r4, r4, #1
@	  cmp r0, #12
@	  beq repeat
@	  mov pc, lr

@suma:	add r5, r5, #1
@	add r4, r4, #1
@	mov pc, lr

@repeat: cmp r7,#2
@	beq resultado
@	mov r7, #2
@	mov r6, r5
@	mov r1, #8
@	b inicio

@resultado: add r1, r6, r5
@stop:	wfi
@	.end
