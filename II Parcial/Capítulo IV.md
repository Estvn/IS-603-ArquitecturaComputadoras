# INSTRUCCIONES DE TRANSFERENCIA DE DATOS
- Este capítulo se centra en las instrucciones de transferencia de datos. Estas instrucciones permiten transferir información entre la memoria y los registros del procesador, y viceversa. distinguiendose, según el destino de transferencia entre **instrucciones de carga**, las que transfieren información a los registros, e **intrucciones de almacenamiento**, las que transfieren información a la memoria.

- Las instrucciones de transferencia de datos son las únicas que pueden acceder a la memoria. 
- Esto implica que para poder realizar operaciones con datos almacenados en la memoria, primero será necesario cargarlos en registros, y una vez realizadas las operaciones pueden ser almacenados sus resultados en memoria. Esta decisión permite que la arquitectura disponga de un juego de instrucciones más simple.
* **Arquitectura de carga/almacenamiento.**

* **En la arquitectura ARM, las instrucciones de transferencia de datos son las únicas que pueden acceder a la memoria.**
_________________________________________________________________________________________________________________________________________________________________________________________________________________

# INSTRUCCIONES DE CARGAa
Las instrucciones de carga son las que transfieren información a los registros. Esta información puede estar en la propia instrucción o en memoria.

## Carga de Datos Constantes
### Información importante sobre la seudointrucción lrd
- La instrucción <<mov>> permite cargar un dato inmediato de tamaño byte en el registro <<mov rd, #Inm8>>
Cuando se desean cargar registros que ocupen más de un byte, la instrucción de carga <<mov>> no se puede utilizar.

- La instrucción <<ldr>> es una instrucción de carga, que puede cargar en los registros datos de hasta 32 bits.
- La instrucción <<ldr>> es una seudoinstrucción, no es una instrucción máquina debido a que las instrucciones máquina tienen un espacio reservado para los registros de destino, código de operación y otros elementos de una instrucción máquina. **Por el contrario, las instrucciones ldr ya ocupan los 32 bits de la instrucción, y no quedan bits disponibles para codificar bits disponibles propios de las instrucciones máquina.**

* Si se utiliza <<ldr>> para hacer carga de un dato que cabe en un byte, la instrucción será reemplazada por <<mov>>.
* Si el dato que se carga utilizando <<ldr>> necesita más de un byte para codificarse, entonces se copia el valor del dato inmediato en la memoria, seguidamente, el programa sustituye la seudoinstrucción por una instrucción de carga relativa al PC.
* **Con la seudoinstrucción <<ldr>> se puede hacer carga de datos inmediatos escritos en el programa, pero también se puede hacer carga de la dirección de memoria RAM de una variable, haciendo uso directo de su etiqueta**.

## Carga de Palabras
<<ldr rd, [rb]>> | rd <- [rb]
<<ldr rd, [rb, #offset5]>> | rd <- [rb + offset5]
<<ldr rd, [rb, ro]>> | rd <- [rb + ro]

- Estas instrucciones de memoria solo se diferencian en la forma en la que indican la dirección de memoria desde la que se quiere cargar una palabra en el registro, es decir, se diferencian en sus modos de direccionamiento.

## Carga de Bytes y Medias Palabras
### Carga de bytes
- Cuando se carga una palabra de la memoria al registro, simplemente se cargan los 32 bits de la memoria a 32 bits del registro. De esta forma, el registro pasa a tener exactamente el mismo contenido que la palabra de memoria.
* Sin embargo, cuando se copia un byte de memoria al registro, los 8 bits de la memoria se copian en los 8 bits de menor peso en el registro. Los 24 bits restantes deben ser rellenados, ya que pueden almacenarse tanto número positivos o negativos, la forma correcta de rellenar los bits que quedan libres es con la **extensión de signo**. La exntesión de signo consiste en rellenar los bits restantes con 0 si el número almacenado es positivo, o con 1 si el número almacenado es negativo.
**Cuando se vaya a cargar un byte, el ensamblador deberá permitir especificar si se quiere extender o no su signo. Será el programador dependiendo de si la variable en cuestión corresponde a un número con signo o no, quien active la extensión de signo.**
El razonamiento anterior también aplica cuando en lugar de un byte también se quiere cargar media palabra.

* No hay instrucciones para bytes que carguen el dato en la memoria y a la vez extiendan el signo, por eso se usa el <<ldrb>> para realizar la carga del dato en el registro, y luego se usa <<sxtb>> para realizar la extensión del signo del byte de menor peso en el registro, en los casos donde sea necesario.
- **El desplazamiento utilizado en carga de bytes debe ser un número comprendido entre 0 y 31.**
<<ldrb rd, [rb]>>
<<sxtb rd, rd>>

<<ldrb rd, [rb, #offset5]>>
<<sxtb rd, rd>>

<<ldrsb rd, [rb, ro]>>

### Carga de medias palabras
- Cuando se realiza una carga de medias palabras, el número de desplazamiento debe ser un múltiplo de 2 comprendido entre 0 y 62. Las primeras dos variantes no tienen una instrucción equivalente que pueda realizar la carga y extensión de signo de la media palabra en memoria. 
<<ldrh rd, [rb]>>
<<sxth rd, rd>>

<<ldrh rd, [rb, #offset5]>>
<<sxth rd, rd>>

<<ldrsh rd, [rb, ro]>>
_________________________________________________________________________________________________________________________________________________________________________________________________________________

# INSTRUCCIONES DE ALMACENAMIENTO
- Las instrucciones de almacenamiento son las que transfieren información a la memoria. La información que se transfiere parte siempre de un registro. Con las instrucciones de almacenamiento en memoria se toma el contenido que está en el registro y se pega en la dirección de memoria destino. El proceso de almacenamiento no requiere de instrucciones de extension de signo.

## Almacenamiento de Palabras
- Las instrucciones de carga de palabras solo se diferencian en la forma en la que indican la dirección de memoria en la que se quiere almacenar el contenido en rd.
«str rd, [rb]» | [rb] <- rd
«str rd, [rb, #Offset5]» | [rb + #Offset5] <- rd | el desplazamiento debe ser un número múltiplo de 4 entre 0 y 124.
«str rd, [rb, ro]» | [rb + ro] <- rd

## Almacenamiento de bytes y medias palabras
- Para almacenar bytes o medias palabras en memoria simplemente se va a copiar el contenido de un registro a una posición en memoria del mismo tamaño.
- Para almacenar bytes se pueden utilizar las siguientes variantes de la instrucción <<strb>>. Recordando que el valor de desplazamiento debe ser un número comprendido entre 0 y 31.
<<strb rd, [rb]>>
<<strb rd, [rb, #Offset5]>>
<<strb rd, [rb, ro]>>

- Para almacenar medias palabras se pueden usar las variantes de la instrucción <<strh>>, y el número que se usa para desplazamiento debe ser múltiplo de 2 y ser comprendido entre el rango de 0 y 62.
<<strh rd, [rb]>>
<<strh rd, [rb, #Offset5]>>
<<strh rd, [rb, ro]>>
_________________________________________________________________________________________________________________________________________________________________________________________________________________

# MODOS DE DIRECCIONAMIENTO Y FORMATOS DE INSTRUCCIÓN DE ARM
## Direccionamiento Indirecto con Desplazamiento
- En el modo de direccionamiento indirecto con desplazamiento, la dirección efectiva del operando es una dirección de memoria que se obtiene sumando el contenido de un registro y un desplazamiento especificado en la propia instrucción.
Por tanto, si un operando utiliza este modo de direccionamiento, el formato de instrucción deberá proporcionar dos campos para dicho operando: uno para especificar el registro y otro para el desplazamiento inmediato.
* **Modo de direccionamiento indirecto con desplazamiento. En este modo, la dirección efectiva del operando es una posición de memoria. En la instrucción se codifica el número del registro rb y un dato inmediato, Offset5, la suma del contenido de dicho registro y el dato inmediato proporciona la dirección de memoria en la que está el operando**.
<<ldr rd, [rb, #Offset5]>>

## Direccionamiento Relativo al Contador del Programa
- Este modo especifica la dirección efectiva del operando como la suma del contenido del contador de programa y un desplazamiento codificado en la propia instrucción.

## Direccionamiento Indirecto con Registro de Desplazamiento
- La dirección efectiva del operando es una dirección de memoria que se obtiene sumando el contenido de dos registros. Por tanto, si un operando utiliza este modo de direccionamiento, el formato de instrucción deberá proporcionar dos campos para dicho operando: uno para cada registro. Como se puede ver, es muy similar al relativo a registro con desplazamiento. La diferencia radica en que el desplazamiento se obtiene de un registro en lugar de un dato inmediato.

## Formato de Instrucciones de Carga/Almacenamiento de Bytes y Palabras con Direccionamiento Indirecto con Desplazamiento
- Este formato de instrucción lo utilizan las siguientes instrucciones de carga y almacenamiento: «ldr», «str», «ldrb» y «strb».
- En el caso de las instrucciones de carga y almacenamiento de palabras es posible aprovechar mejor los 5 bits del campo si se tiene en cuenta que una palabra solo puede ser leída o escrita si su dirección de memoria es múltiplo de 4. Al haber múltiplos de 4 tendrían los dos últimos bits siempre a 0.
- **Los datos inmediatos que se usan en las instrucciones de carga o almacenamiento se codifican en la memoria con 5 bits, el tamaño del número depende del tipo de datos que se va cargar o almacenar, De esta forma se estarían codificando 7 bits de desplazamiento dejando únicamente 5, y los 2 restantes se sabe que es 0**.
* En las instrucciones de carga de palabras como <<ldr>>, el número inmediato se codifica en 7bits, pero en las derivaciones de estas instrucciones, que son los datos de media palabra y bytes, los datos inmediatos se codifican en 5bits.

## Formato de las Instrucciones de Carga/Almacenamiento de Medias Palabras con Direccionamiento Indirecto con Desplazamiento
- El campo offset5 permite codificar un dato inmediato de 6 bits almacenando en el únicamente 5 bits de mayor peso, ya que el bit de menor peso no es necesario almacenarlo, ya que siempre valdrá 0.
- Los desplazamientos de las instrucciones de carga y almacenamiento de medias palabras estarán en el rango de [0, 62] bytes.
- Para poder leer o escribir una media palabra, esta debe ser almacenada en una dirección múltiplo de 2, y un múltiplo de 2 en binario siempre tiene el bit de menor peso a 0.

## Formato de la Instrucción de Carga con Direccionamiento Relativo al PC
- la instrucción «ldr rd, [PC, #Offset8]» carga una palabra cuya dirección de memoria tiene que estar alineada a 4 y el campo Offset codifica un número múltiplo de 4, por lo que se acaba de comentar, en el campo Offset8, de 8 bits, se codifica en realidad un dato inmediato de 10 bits —se guardan solo los 8 bits de mayor peso, ya que los dos de menor peso no es necesario guardarlos ya que siempre serán 0.
- De esta forma, el rango del desplazamiento es en realidad de [0, 1020] bytes3 —o lo que es lo mismo, de [0, 255] palabras—.

## Formatos de Instrucción de Carga/Almacenamiento con Direccionamiento Indirecto con Registro de Desplazamiento
«ldr rd, [rb, ro]»,
«ldrb rd, [rb, ro]»,
«str rd, [rb, ro]» y
«strb rd, [rb, ro]»
/
«strh rd, [rb, ro]»,
«ldrh rd, [rb, ro]»,
«ldrsh rd, [rb, ro]» y
«ldrsb rd, [rb, ro]».


	.data
v:	.word 10,20
	
	.text
main:	ldr r0, =v
	ldr r1, [r0]
	ldr r2, [r0, #4]
	add r3, r2, r1
	str r3, [r0, #8]
stop:	wfi
	.end








































