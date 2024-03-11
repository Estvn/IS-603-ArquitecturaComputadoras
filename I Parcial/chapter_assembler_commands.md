## Notación RTL
<<r4 = 20>>
<<0x2000 0004 <- r4 + 1>>

## Palabras reservada de ensamblador
<<add r3, r1, r2>>
<<@>>, <<#>> y <</* */>>

* Seudoinstrucciones. Las seudoinstrucciones existen para facilitar el trabajo del programador. No pueden ser codificadas directamente a lenguaje máquina, ya que no forman parte del repertorio de instrucciones de la arquitectura en cuestión.

* Etiquetas. Sirven para referirse a la dirección en memoria del elemento contenido en la línea en la que se encuentran. **Para declarar una atqueta, esta debe estar el inicio de la línea, estar formada por letras y números, pero no puede iniciar con número, y terminar con el signo de dos puntos <<:>>**.

* Directivas. Sirven para informar al ensamblador sobre como interpretar el código fuente.
**Etiqueta: operacion op1, op2, op3 @ comentario**

	.text		@ Indica el inicio de la ejecución del programa en esta línea. La carga del programa, instrucciones y las variables creadas en la memoria ROM.
main:   mov r0, #0	@ Inicializa la variable r0 en 0
	mov r1, #10	@ Inicializa r1 en 10
loop:   mov r2, r1	@ Le asigna a r2 el contenido de la variable r1
	mul r2, r1	@ Le asigna a r2 el contenido de r1 al cuadrado
	mul r2, r1	@ Le asigna a r2 el contenido de r1 al cubo
	add r0, r0, r2  @ Suma el contenido de r0, r2 y lo guarda en la variable r0
	sub r1, r1, #1  @ Decrementa la variable r1 en 1
	bne loop	@ Si r1 != 0 salta a la línea de la etiqueta loop
stop:   wfi		@ Detiene el programa de forma obligatoria
	.end		@ Indica el final del programa (esta línea no es estrictamente necesaria). Señala el final del módulo que se quiere ensamblar.
	
1. Un bloque de memoria ROM en la dirección 0x0018 0000, en el que se encuentra el código máquina correpondiente al programa ensamblado.
2. Un bloque de memoria ROM en la dirección 0x0019 0000, que contiene el código máquina del firmware de ARMSim.
3. Un bloque de memoria RAM que comienza en la dirección 0x2007 0000, que se utiliza para almacenar los datos requeridos por el programa.
4. Un bloque de memoria RAM en la dirección 0x2008 0000, que está mapeado por el visualizador LCD.

## Literales
* Un valor literal es un número (decimal, binario, octal o hexadecimal), un carácter o una cadena de caracteres que se indican tal cual en el programa de ensamblador.
Cuando se hace uso de un literal en el código, este debe estar precedido del carácter <<#>>.

- La forma más común de escribir números literales es en decimal, pero es buena práctica definir los números en hexadecimal, binario u octal. Se debe hacer uso de los siguiente prefijos para definirlos:
**<<0x>> para hexadecimal, <<0>> para octal, y <<0b>> para binario.**
- La forma de escribir un carácter literal es cerrandolo entre comillas simples, siempre precediendo el símbolo <<#>>. **<<mov r0, #'L'>>**. Aunque basta poniendo una comilla simple antes del carácter.
- La forma de escribir una cadena de caracteres es cerrandola entre comillas dobles, precediendo el símbolo <<#>>. **<<msg: .asciz #"Hola Mundo!">>**.

## Constantes
* Para definir constantes se deben definir en alguna parte del código, y se usan directivas para llevar a cabo este procedimiento.
- **<<.equ>> y <<.set>>** se usan para definir constantes.
- **<<.eqv>> y <<.equiv>>** también se usan para definir constantes, pero estas directivas verifican que no se ha definido la variable de la constante previamente, así se evita un error de ejecución en el programa.
.equiv Monday, 1
- Cuando se hace uso de una directiva, también debe agregarse antes de la literal el símbolo <<#>>.
main: 	mov day, #Monday

## Personalizar el nombre de los registros
Se puede personalizar el nombre de los registros en caso que se deseen utilizar más adelante en el código.
- **<<.req>>** se usa para asignar un nombre a un registro, y **<<.unreq>>** se usa para desasociar un nombre a un registro.
.text
day .req r7
.unreq day

## Secciones del código
- La sección de código está definida por la directiva <<.text>>.
- La sección de datos se define con la directiva <<.data>>, y se define en que parte del código fuente comienza la sección de datos. La reservas e inicializaciones de datos indicadas con esta directiva se realizan en la memoria RAM a partir de la dirección 0x2007 0000.

- **Los carácteres ASCII no requieren más de un byte por carácter**.
- La capacidad de expresión de un byte es bastante reducida. Por ello, la mayoría de los computadores trabajan de forma habitual con unidades superiores al byte. Esta unidad superior recibe el nombre de **palabra**.
- Al contrario de un byte, que está compuesto por 8 bits, una palabra equivale a 4 bytes (es decir, a 32 bits en la arquitectura ARM).

	.data
word1:	.word 15
word2:  .word 0b11

	.text
stop:	wfi
_______________________________________

	.data
byte1:	.byte value8
byte2:	.byte 0x10

	.text
stop:	wfi
_______________________________________

# INICIALIZACIÓN DE MEDIAS Y DOBLES PALABRAS
- **<<.hword>>** para inicializar medias palabras: .hword value16
- **<<.quad>>** para inicializar dobles palabras: .hword value64

# INICIALIZACIÓN DE CADENAS DE CARÁCTERES
- **<<.ascii "cadena">>** 
- **<<.asciz "cadena">>**

# RESERVA DE ESPACIO
**<<.space N>>** es una directiva que se utiliza para reservar N bytes de memoria, e inicializarlos en 0.
Esta directiva se usa en la seccion de datos.

# ALINEACIÓN DE DATOS EN LA MEMORIA
* La directiva **<<.balign N>>** indica que el siguiente dato que vaya a inicializarse o reservarse en memoria, debe comenzar en una dirección que sea múiltiplo de N.
* La directiva **<<.align N>>** indica que el siguiente dato que vaya a inicializarse o reservarse en memoria, debe comenzar en una dirección que sea múiltiplo de 2^N.








