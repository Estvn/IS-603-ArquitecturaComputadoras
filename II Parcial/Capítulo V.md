# INSTRUCCIONES DE CONTROL DE FLUJO
Los programas de los capítulos anteriores constan de una serie de instrucciones que se ejecutan de manera secuencial. Este tipo de ejecución en los programas presenta bastantes limitaciones, por ejemplo, un programa secuencial no puede realizar distintas acciones en función de los datos de entrada o de los resultados obtenidos. Tampoco puede repetir un número de veces ciertas operaciones, a menos que la misma instrucción esté escrita varias veces en el programa; incluso si se escribiera varias veces una misma instrucción, el programa sería incapaz de varias en el número de veces que ejecuta estas instrucciones.  

* Cuando el procesador ejecuta una instrucción de transformación, como <<add>> o <<cmp>>, se actualizan los indicadores (n, c, z, v) en función del resultado obtenido. 
* De esta forma, cuando posteriormente se ejecute una instrucción de flujo de control, podrá realizarse una acción u otra dependiendo del valor de dichos indicadores.

Debido a la gran ventaja que supone el que un programa pueda tomar diferentes acciones y que pueda repetir un conjunto de instrucciones un número de vecer variable, los lenguajes de programación proporcionan dichas funcionalidades por medio de **estructuras de control repetitivas y condicionales**.

- Estas estructuras de control permiten modificar el flujo secuencial de las instrucciones.
* **Las estructuras de control condicionales** permiten la ejecución de ciertas partes del código en función de una serie de condiciones.
* **Las estructuras de control repetitivas** permiten la repetición de cierta parte del código hasta que se cumpla una determinada condición de parada.

## Saltos Incondicionales y Condicionales
Las estructuras de control, condicionales y repetitivas se implementan por medio se saltos condicionales e incondicionales. 
A continuación se presentan los tipos de saltos incondicionales y condicionales que soporta ARM, y las instrucciones que implementan.

### Saltos Incondicionales 
- Los saltos incondicionales son aquellos que se realizan siempre, es decir, no dependen de una condición para poder realizar el salto.
- La instrucción de ARM que realiza un salto incondicional es <<b etiqueta>>, donde <<etiqueta>> es la dirección de memoria de la instrucción a la que se quiere saltar.

- Al tratarse de una instrucción de salto incondicional, cada vez que se ejecute <<b etiqueta>>, el programa salta a la instrucción de la etiqueta, independientemente de los valores que tengan los indicadores del registro de estado.

### Saltos Condicionales
Las instrucciones de saldo condicional presetan la siguiente forma: <<bXX etiqueta>>, donde <<XX>> presenta un nemotécnico que indica la instrucción que se debe cumplir para realizar el salto, y  <<etiqueta>> indica la instrucción de memoria a la que se quiere saltar en el caso de que se cumpla dicha condición. 

- Cuando el procesador ejecuta una instrucción de salto condicional, comprueba los indicadores de registro de estado para decidir si realiza el salto o no.
- Por ejemplo, si se ejecuta la instrucción <<beq etiqueta>> (branch if equal), el procesador comprueba si el indicador Z está activo.
- De forma similar, si se ejecuta la instrucción <<bne etiqueta>> (branch if not equal), saltará a la instrucción si el indicador Z no está activo.

## Estructuras de Control Condicionales
- Los saltos condicionales e incondicionales vistos anteriormente se utilizan para construir estructuras de control condicionales y repetitivas.

### Estructura condicional 'if-then'
	.data
X:	.word 1
Y:	.word 1
Z:	.word 0

	.text
main:	ldr r0, =X
	ldr r0, [r0]	@ r0 <- [X]
	ldr r1, =Y
	ldr r1, [r1]	@ r1 <- [Y]

	cmp r0, r1
	bne finsi
	  add r2, r0, r1  @- 
	  ldr r3, =Z	  @ [Z] <- [X] + [Y]
	  str r2, [r3]	  @- 

finsi:	wfi

- En el programa anterior se hace uso de un <<if>> simple, en este caso se hace una comparación si los valores X e Y no son iguales. La instrucción <<bne>> revisa si el indicador de estado Z se encuentra apagado, de ser así, está línea de código se dirige a la instrucción del programa a la que apunta la atiqueta, caso contrario donde los valores son iguales, la línea de la condición omite el salto hacía la instrucción del programa a la que apunta la atiqueta y el programa sigue con su flujo natural.

* **Zona de datos**.
1. Inicialización de las variables de entrada.
2. Reserva de espacio para resultados.

* **Zona de código**.
1. Carga de variables de entrada de registros.
2. Operaciones.
3. Almacenamiento de los resultados en memoria.

### Estructura condicional 'if-then-else'
Se trata de una extensión de la estructura <<if-then>>, que permite indicar que se quiere hacer cuando se cumpla o no una determinada condición. 
- Cuando se escriba un programa equivalente en código máquina, las instrucciones de salto que se utilicen determinarán, en función de la condición evaluada y del tipo de salto, que instrucciones del programa se ejecutan y cuáles no.

	.data
X:	.word 1
Y:	.word 1
Z:	.word 0

	.text
main:	ldr r0, =X
	ldr r0, [r0]		@ r0 <- [X]
	ldr r1, =Y
	ldr r1, [r1]		@ r1 <- [Y]

	cmp r0, r1
	bne else
	  add r2, r0, r1	@ r2 <- [X] + [Y]
	  b finsi

else:     add r2, r0, #5	@ r2 <- [X] + 5

finsi:	ldr r3, =Z
	str r2, [r3]		@ [Z] <- r2

stop:	wfi


## Estructuras de Control Repetitivas
En este apartado se verán las dos estructuras de control repetitivas, también llamadas iterativas, que se utilizan con más frecuencia, <<while>> y <<for>>, y cómo se implementan a nivel de máquina.

### Estructura de control repetitiva 'while'
- La estructura de control repetitiva <<while>> permite ejecutar repetidamente un bloque de código mientras se siga cumpliendo una condición.
- La estructura <<while>> funciona igual que una estructura <<if-then>>, en el sentido que si se cumple la condición evaluada, se ejecuta el código asociado a dicha condición. Pero a diferencia que la estructura <<if-then>> una vez que se ha ejecutado la última instrucción del código asociado a la condición, el flujo del programa vuelve a la evaluación de la condición y todo el proceso se vuelve a repetir mientras se cumpla la condición.

	.data
X:	.word 1
E:	.word 1
LIM:	.word 100

	.text
main:	ldr r0, =X	
	ldr r0, [r0]	@ r0 <- [X] 
	ldr r1, =E	
	ldr r1, [r1]	@ r1 <- [E] 
	ldr r2, =LIM	
	ldr r2, [r2]	@ r2 <- [LIM] 

bucle:	cmp r0, r2
	bge finbuc
	  lsl r3, r1, #1	@ r3 <- 2 * [E]
	  add r0, r0, r3	@ r0 <- [X] + 2 * [E]
	  add r1, r1, #1	@ r1 <- [E] + 1
	  ldr r4, =X
	  str r0, [r4]    	@ [X] <- r0
	  ldr r4, =E
	  str r1, [r4]		@ [E] <- r1
	b   bucle

finbuc: wfi

### Estructura de control repetitiva for
- Se suele utilizar como condición para finalizar unn bucle, el número de veces que se ha iterado sobre él.
- En esta caso, se utiliza una variable para llevar la cuenta del número de iteraciones realizadas, que recibe el nombre de contador.
* Para implementar un  bucle con dichas características, bastaría con inicializar un contador (p.e a 0) y utilizar la estructura while, de tal forma que mientras dicho contador no alcance un determinado valor, se llevaría a cabo una iteración de las acciones que forman parte del bucle y se incrementaría en 1 el valor almacenado en el contador.

	.data
V:	.word 2, 4, 6, 8, 10
n:	.word 5
suma:	.word 0

	.text
main:	ldr r0, =V	@ r0 <- direcciÃ³n de V		
	ldr r1, =n
	ldr r1, [r1]   	@ r1 <- [n]
	ldr r2, =suma
	ldr r2, [r2]	@ r2 <- [suma]
	mov r3, #0    	@ r3 <- 0

bucle:	cmp r3, r1     	
	beq finbuc
	  ldr r4, [r0]   
	  add r2, r2, r4	@ r2 <- r2 + V[i]
	  add r0, r0, #4
	  add r3, r3, #1
  	b bucle

finbuc: ldr r0, =suma
	str r2, [r0]	@ [suma] <- r2

stop:	wfi

## Modos de Direccionamiento y Formatos de Instrucción de ARM
Se presetan los modos de direccionamiento empleados en las instrucciones de salto y sus formatos de instrucción.

### Direccionamiento de las instrucciones de salto
* Uno de los operandos de las instrucciones de salto, es justamente la dirección de salto, que se indica por medio de una etiqueta, que a su vez referencia la dirección de memoria a la que se quiere saltar.
- Una opción sería la de codificar la dirección de salto en la propia instrucción. Pero esto puede provocar dos problemas:

1. El primero de los problemas, es que puesto que las instrucciones de memoria ARM ocupan 32 bits, si se quisiera codificar los 32 bits de salto en la propia instrucción, sería necesario recurrir a instrucciones que ocupan más de 32 bits. Al menos para las instrucciones de salto, puesto que no todas las instrucciones tienen que ser del mismo tamaño.
2. El segundo de los problemas, si se codifica la dirección completa del salto como un valor absoluto, forzaría a que el código se tuviera que ejecutar siempre en las mismas direcciones de memoria.
Esta limitación se podría evitar durante la fase de carga del programa: bastaría con que el programa cargador, cuando carga unbn código parasu ejecución, sustituyera las direcciones de salto absolutas por nuevas direcicones teniendo en cuenta la dirección de memoria a partir de la cuál se está ejecutando el código.
- **Aunque de esta forma se solventaría el hecho de que el programa se deba ejecutar siempre en las mismas posiciones de memoria, no es una solución factible o la más óptima.**

* Por lo tanto, para que las instrucciones de salto sean pequeñas, y el código sea directamente reubicable en su mayor parte, **en lugar de saltos absolutos se suele recurrir a saltos relativos.**
_____________________________________________________________________________________________________

- Para entender los saltos relativos debe darse cuenta que la mayoría de las veces, los saltos se realizan en una posición cercana a aquella instrucción desde la que salta.
Por lo tanto, el contenido del registro PC, que tiene la dirección de la siguiente instrucción a la actual, se convierte en un punto de referencia idoneo.
- **Así pues, los saltos relativos se codifican como saltos relativos al PC**
- En ARM, los saltos condicionales e incondicionales utilizan el modo de direccionamiento relativo al PC para codificar la dirección de salto.

- El operando destino de las instrucciones de salto es siempre el registro PC, por lo que el modo de direccionamiento utilizado para indicar el operando destino que es implícito.

### Formato de las instrucciones de salto incondicional
- El formato de instrucción utilizado para codificar la instrucción de salto incondicional <<b etiqueta>> está formado por dos campos. El primero de ellos corresponde al código de operación. El segundo campo, que consta de 11 bits se destina para codificar el desplazamiento.
- **En esta instrucción incondicional se puede hacer la codificación de un desplazamiento de 12 bits.** 
- Puesto que las instrucciones Thumb ocupan 16 o 32 bits, el número de bytes del desplazamiento va a ser siempre un número par, y por lo tanto, el último bit de desplazamiento va a ser siempre 0.

* La dirección de memoria a la que se quiere saltar se calcula como un desplazamiento de 12 bits con respecto al contenido del PC.
* Para acelerar la ejecución de las instrucciones, la arquitectura ARM utiliza un cauce de ejecución de instrucciones con 3 etapas:
1. Lectura.
2. Codificación.
3. Ejecución.
* **El registro PC tendrá el valor de PC+4**
* Así pues, el desplazamiento codificado como dato inmediato deberá ser tal que al sumarse PC+4 se consiga la dirección de memoria a la que se quiere saltar.

### Formato de las instrucciones de salto condicional
- Las instrucciones de salto condicional funcionan de forma similar que las instrucciones de salto incondicional, con la diferencia que **el campo utilizado para codificar el salto es de 8 bits.** 














