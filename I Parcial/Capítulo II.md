* El lenguaje ensamblador de ARM, esta arquitectura proporciona dos juegos de instrucciones diferenciados:
- Un juego de instrucciones estándar, donde todas las instrucciones ocupan 32 bits. 
- Otro juego de instrucciones, conocido como Thumb, en el que la mayoría de las instrucciones ocupan 16 bits. Utilizar el juego de instrucciones Thumb, reduce el tamaño de los programas prácticamente a la mitad.

* El juego de instrucciones Thumb presenta dos ventajas:
- Hace posible seleccionar dispositivos con menores requisitos de memoria, y por tanto con un menor coste de fabricación.
- Puesto que el programa ocupa menos el número de accesos a la memoria, se reduce el tiempo de ejecución, lo que de nuevo permite ajustar a la baja las características del dispositivo necesario para ejecutar dicho código, reduciendo así aún más el costo de fabricación.

Para programar en ensamblador con ARM se debe elegir el juego de instrucciones con el que se va a programar (Thumb o 32 bits), y que convenio de ensamblador se quiere utilizar (ARM o GNU).
En este libro se usa el juego de instrucciones Thumb, y el convenio de GNU en QtARMSim.

# INTRODUCCIÓN AL ENSAMBLADOR Thumb DE ARM
Sintaxis del lenguaje ensamblador Thumb de ARM.

## Notación RTL
Es una notación que permite describir las operaciones llevadas a cabo por las instrucciones máquina de forma genérica. 
- Cuando se quiera referir a nombre de dicho registro, se utilizará el nombre de dicho registro. Cuando se describa una operación, r4 hará referencia en realidad al contenido del registro r4, no al registro en sí.
- Para indicar el contenido de una posición en memoria, se usarán corchetes. Así, [0x2000 0004] hará referencia al contenido de la dirección en memoria 0x2000 0004. De igual forma, [r4] también hará referencia al contenido de una dirección de memoria, la indicada por el contenido de r4.
- Para mostrar el contenido actual de una posición en la memoria o un registro, se usará el símbolo <<=>>. Aspi por ejemplo, se usará <<r4 = 20>> para indicar que el registro r4 contiene el número 20.
- Para indicar una transferencia de datos, se usará el símbolo << <- >>. Por ejemplo, para indicar que la dirección de memoria 0x2000 0004 se debe sobreescribir con el contenido del registro r4 mas el número 1,
se utilizará la siguiente expresión: <<[0x2000 0004 <- r4 + 1]>>.

## Diferencias entre código máquina y código ensamblador

### Código máquina
- El código máquina es el lenguaje que entiende el procesador. Una instrucción en código máquina es una secuencia de ceros y unos que constituyen un código que el procesador es capaz de interpretar como una instrucción, y por tanto, puede ejecutar.
Una instrucción en código máquina no es más que un conjunto de instrucciones máquina y de datos, que cuando son ejecutadas por el procesador realizan una determinada tarea. 

- Antes se codificaba en unos y ceros, esto era un trabajo arduo y propenso a errores. Por esta razón se crea un lenguaje de programación muy cercano al lenguaje máquina, pero de forma más cercana al lenguaje humano, y este recibe el nombre de **lenguaje ensamblador**.

### Lenguaje ensamblador
Este lenguaje permite escribir las instrucciones máquina en forma de texto. Así pues la instrucción máquina 0001100010001011, se escribiría en el lenguaje ensamblador Thumb de ARM como <<add r3, r1, r2>>. Lo que es más fácil de entender que la instrucción en código binario. 

Aunque el lenguaje ensamblador es más asequible para nosotros que las secuencias de ceros y unos, sigue estando estrechamente ligado al hardware y arquitectura al que va a ser utilizado. La sintaxis del lenguaje ensamblador cambia en las diferentes arquitecturas de computadoras que hay.
**El lenguaje ensamblador entra en las categorías de lenguajes de programación de bajo nivel** ya que está relacionado fuertemente con el hardware en el que se va a utilizar.

- El lenguaje ensamblador lee un fichero de texto con el código fuente en ensamblador y genera un fichero objeto con instrucciones en código máquina que el procesador es capaz de entender. El ensamblador no se limita a reproducir el juego de instrucciones de una arquitectura en concreto, en un lenguaje más cercano al humano, si no que también proporciona una serie de recursos adicionales destinados a facilitar la programación en dicho lenguaje.

### Estos son algunos de los recursos, en el caso de ensamblador de GNU para ARM:
* Comentarios. El ensamblador, al encontrar algún carácter de comentario, ignora el caracter y todo lo que le sigue.
Algunos signos para hacer comentarios son <<@>> y <<#>>, que se usan para escribir líneas de comentarios, pero es más común usar el arroba, y <</* */>> que se usa para generar párrafos de comentarios.

* Seudoinstrucciones. Las seudoinstrucciones existen para facilitar el trabajo del programador. No pueden ser codificadas directamente a lenguaje máquina, ya que no forman parte del repertorio de instrucciones de la arquitectura en cuestión. El programador puede hacer uso de las seudoinstrucciones sin pensar en su traducción a lenguaje máquina, ya que el programa ensamblador se encargará de traducir automáticamente cada seudoinstrucción por la instrucción máquina que le corresponde.

* Etiquetas. Sirven para referirse a la dirección en memoria del elemento contenido en la línea en la que se encuentran. **Para declarar una atqueta, esta debe estar el inicio de la línea, estar formada por letras y números, pero no puede iniciar con número, y terminar con el signo de dos puntos <<:>>**.
Cuando el programa ensamblador encuentra la definición de una etiqueta en el código fuente, anota la dirección asociada a dicha etiqueta. De esta forma, cuando más adelante encuentre la etiqueta, hara una sustitución por un valor númerico, que puede ser la dirección de memoria a la que se asocia la etiqueta, o un desplazamiento relativo a la dirección de memoria de la instrucción actual.

* Directivas. Sirven para informar al ensamblador sobre como interpretar el código fuente. Son palabras reservadas que el ensamblador reconoce. Se identifican fácilmente ya que comienzan con un punto.
**Etiqueta: operacion op1, op2, op3 @ comentario**

Un programa ensamblador está compuesto de dos tipos de sentencias: 
- Instrucciones, que dará lugar a instrucciones máquina.
- Directivas, que informan al programa ensamblador como interpretar el código fuente. 

* Características de las directivas:
1. Las directivas informan al programa ensamblador de dónde se debe colocar el código en memoria.
2. Reservan espacio en memoria para el almacenamiento de las variables del programa.
3. Inicializa los datos que pueda necesitar el programa.

Para que el programa ensamblador pueda ser ensamblado y ejecutado es necesario añañdir la primera y la penúltima línea, que son directivas. La última línea no es estrictamente necesaria 

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

## Ejecución, descripción y confiuguración
Panel de preferencias para ocnfigurar el modo de ejecución, y el puerto del servidor donde se hará la ejecución.

En el modo se simulación se úede consultar el contenido de la memoria del computador simulado en los paneles de memoria y de volcado de memoria. 
El computador simulado dispone de 4 bloques de memoria, dos de ROM, y dos de RAM.
1. Un bloque de memoria ROM en la dirección 0x0018 0000, en el que se encuentra el código máquina correpondiente al programa ensamblado.
2. Un bloque de memoria ROM en la dirección  0x0019 0000, que contiene el código máquina del firmware de ARMSim.
3. Un bloque de memoria RAM que comienza en la dirección 0x2007 0000, que se utiliza para almacenar los datos requeridos por el programa.
4. Un bloque de memoria RAM en la dirección 0x2008 0000, que está mapeado por el visualizador LCD.

* El código máquina de un programa se puede consultar en tres sitios: En el panel de memoria (a nivel de palabra), el panel de volcado de memoria (a nivel de byte) y en la ventana central (a nivel de instrucción).
- El simulador permite visualizar el contenido de los registros del r0 al r15, donde r15 es el contador del programa, que reside en la dirección 0x0018 0000, que es donde comienza las direcciones del bloque de ROM donde se encuentran los datos del código máquina del programa, por ende, el contador del programa es la primera instrucción en ser ejecutada al correr el programa.

### Desensamblado
* En el modo simulador, en una ventana se muestra información correspondiente a una instrucción máquina. Esta infromación se obtiene mediante un proceso conocido como **desensamblado**, y que se realiza a partir del contenido de la memoria ROM.
* Con el proceso de desensamblado se puede mostrar la siguiente información:
1. La dirección en memoria en la que está almacenada la instrucción máquina.
2. La instrucción máquina expresada en hexadecimal.
3. La instrucción máquina desensamblada.
4. La línea original en lenguaje ensamblador que ha dado lugar a la instrucción máquina.

## Ejecución de un programa completo
Run > run
La direcciones de memoria sobreescritas durante la ejecución de un programa se resaltan en negrita.
Una vez realizada una ejecución completa, lo que generalmente se hace es comprobar si el resultado obtenido es realmente el esperado.

## Recargar la simulación
Cuando se le pide al simulador que ejecute un programa, no está indicando que haga una ejecución del código de principio a fin. Lo que hace es empezar a ejecutar desde la directiva que lo indica hasta encontrar una instrucción de paro (wfi), un error de ejecución o un punto de ruptura. Lo normal es que se detenga cuando encuentra una instrucción de paro.
El codigo al terminar su ejecución, el contador de programa se encontrará apuntando a la dirección donde está la línea de finalización del programa, por lo cual, es necesario  hacer una recarga de la simulación, así el puntero se vuelve a posicionar en la línea de inicio del programa y el sistema en general vuelve al estado inicial. **Run > refresh o f4 para recargar la simulación**.

## Ejecución paso a paso
El simulador proporciona al programador una opción de ejecución paso a paso, para poder ver como se comporta cada línea de código del programa en ensamblador. 
**Se usa Run > Step into o f5 para ejecutar el programa paso a paso**.
Esta opciópn de ejecución es útil en caso de necesitar ver una línea de código que no se comporta como se espera. O para ver como se va desarrollando la ejecución del programa y las modificaciones que se realizan.
**Run > Step Over o f6** hará lo mismo que f5, pero este ejecuta la instrucción si es una instrucción de llamada a una subrutina.

## Puntos de ruptura
Sirve para indicarle al simulador que tiene que parar la ejecución cuando alcance la instrucción en la que se haya definido un punto de ruptura.
Los puntos de ruptura solo puede mostrase y editarse cuando se está en modo de simulación.
Para definir un punto de ruptura se hace click sobre el margen izquierdo de la línea donde se quiere definir un punto de ruptura, lo mismo cuando se quiere eliminar.

# LITERALES Y CONSTANTES EN EL ENSAMBLADOR DE ARM
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

# INICIALIZACIÓN DE DATOS Y RESERVA DE ESPACIO
Lo normal en un programa de ensamblador esque se definan dos secciones en la memoria: Para datos y para código.
- La sección de código está definida por la directiva <<.text>>.
- La sección de datos se define con la directiva <<.data>>, y se define en que parte del código fuente comienza la sección de datos. La reservas e inicializaciones de datos indicadas con esta directiva se realizan en la memoria RAM a partir de la dirección 0x2007 0000.

- **Los carácteres ASCII no requieren más de un byte por carácter**.
- La capacidad de expresión de un byte es bastante reducida. Por ello, la mayoría de los computadores trabajan de forma habitual con unidades superiores al byte. Esta unidad superior recibe el nombre de **palabra**.
- Al contrario de un byte, que está compuesto por 8 bits, una palabra equivale a 4 bytes (es decir, a 32 bits en la arquitectura ARM).
- Cuando se define una palabra, la arquitectura obliga a que este dato deba estar alineado en la memoria, en una dirección que sea múltiplo de 4, y debe haber reservadas 4 direcciones de memoria.
- **Al igual que se puede trabajar con palabras, también se puede con dobles palabras y medias palabras. Su lógica de almacenarse en la memoria es igual a la de las palabras, deben reservarse 2 bytes para las medias palabras y 8 bytes para las dobles palabras. También deben alinearse estos datos en la memoria, en direcciones que sean múltplos de su tamaño. Exceptuando el caso de las dobles palabras, que estas pueden ser alineadas en posiciones que sean múltiplos de 4**.

# INICIALIZACIÓN DE PALABRAS
Un programa en ensamblador se compone la sección de datos y la sección de instrucciones. En la sección de datos se definen las literales y las constantes, y en la sección de instrucciones se definen la líneas de código para realizar tareas.
<<.data>> es la directiva que indica que todo lo siguiente debe ser almacenado en la zona de datos.
**<<.word>>** esta directiva indica al lenguaje ensamblador que se quiere reservar espacio para una palabra, e inicializar dicho espacio con un determinado valor.

	.data
word1:	.word 15
word2:  .word 0b11

	.text
stop:	wfi

Cuando se mencione de las directivas que inicializan datos se sobreentenderá que también reservan espacio en la memoria para los datos. 

# INICIALIZACIÓN DE BYTES
**<<.byte>>** es la directiva que se utiliza para la inicialización de bytes.
Esta directiva se usa en la sección de datos.
	.data
byte1:	.byte value8
byte2:	.byte 0x10

	.text
stop:	wfi

# INICIALIZACIÓN DE MEDIAS Y DOBLES PALABRAS
- **<<.hword>>** para inicializar medias palabras: .hword value16
- **<<.quad>>** para inicializar dobles palabras: .hword value64

# INICIALIZACIÓN DE CADENAS DE CARÁCTERES
- **<<.ascii "cadena">>** 
- **<<.asciz "cadena">>**
Al usar estas directivas, se la memoria con los códigos UTF-8 de los carácteres que componen la cadena entrecomillada.
* **La diferencia entre estas dos directivas radican en que, a diferencia de <<.ascii>>, <<.asciz>> añade un byte a 0 después del último carácter de la cadena. De esta forma se asegura que los valores que componen la cadena siempre sean distintos de cero, y es útil, ya que al recorrer la cadena si el programa se encuentra con el valor 0 sabe que ha llegado al final.**
Java, C y C++ utilizan este método, conocido como "Estándar ASCIIZ" para el almacenamiento de cadenas. 
Estas directivas se usan en la sección de datos.

# RESERVA DE ESPACIO
**<<.space N>>** es una directiva que se utiliza para reservar N bytes de memoria, e inicializarlos en 0.
Esta directiva se usa en la seccion de datos.

# ALINEACIÓN DE DATOS EN LA MEMORIA
* La directiva **<<.balign N>>** indica que el siguiente dato que vaya a inicializarse o reservarse en memoria, debe comenzar en una dirección que sea múiltiplo de N.
* La directiva **<<.align N>>** indica que el siguiente dato que vaya a inicializarse o reservarse en memoria, debe comenzar en una dirección que sea múiltiplo de 2^N.

# FIRMWARE INCLUIDO EN ARMSim
- Firmware es un software que se descarga automáticamente en el simulador, a partir de la posición de memoria 0x0019 0000, se pueden usar subrutinas para ejecutar código, y el resultado de este programa con líneas hechas con subrutinas de Firmware pueden verse en el visualizador LCD.

































 
