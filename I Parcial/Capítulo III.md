- Instrucciones de transformación de datos. Son las que realizan algún tipo de operación sobre los datos utilizando las unidades de transformación del procesador.

# LOS NÚMEROS EN EL COMPUTADOR
* Algunos de los circuitos que forman parte de un computador están diseñados específicamente para ser capaces de almacenar un bit. Es decir, están diseñados para proporcionar y mantener durante cierto tiempo un nivel bajo o alto de tensión.
Puesto que cada uno de estos circuitos almacena un bit, para construir un circuito que almacene una cantidad de información mayor: un byte, una palabra, etcétera, simplemente hay que juntar varios de ellos. De esta forma, por ejemplo, se puede construir un registro de 32 bits juntando 32 circuitos de este tipo, uno para cada uno de los bits del registro.
* Así pues, el número de bits que se puede almacenar en un registro o en una posición de memoria está físicamente determinado por su circuitería. De hecho, todos los espacios de almacenamiento que proporcione el computador tendrán un número de bits prefijado.

- Con cualquier tipo de información que se quiera procesar en un computador, deberá codificarse forzosamente en binario y que, por otro, para almacenar los elementos de dicha información será necesario utilizar uno o más contendores, cada uno con tamaño fijo.
Así pues, una vez se haya decidido como codificar un tipo de información, se deberá seleccionar el tamaño del contenedor más adecuado para dicho tipo. Para ello, se deberá averiguar en primer lugar el máximo número de bits requeridos para codificar cualquiera de los posibles valores que pueda tomar dicho tipo de información. A continuación, simplemente se seleccionará el contenedor con un tamaño superior o igual más cercano al máximo número de bits requerido.
**Entre la información que un computador procesa en contenedores de tamaño fijo, está la información numérica.**

- Los computadores permiten diferenciar entre: enteros sin signo, cuando únicamente trabajan con números positivos del cero, y enteros, cuando trabajan con números enteros y por tanto, con signo.
* Los números enteros sin signo se codifican en binario natural con un determinado número de bits, el del contenedor en el que vayan a almacenarse. Este tamaño por su parte, se escogerán en función de los valores posibles que pueda tomar el tipo de información representada. **Si estos valores están entre 0 y 255 será necesario un byte. Si están entre 0 y 4_294_967_295 será necesaria una palabra.**

* El tamaño del contenedor en el que se almacene el resultado de una operación aritmética también limita los valores posibles que este pueda tomar. Así, si se suman dos números sin signo contenidos en sendos registros de 32 bits, y el resultado de la suma se debe almacenar también en un registro de 32 bits, el máximo resultado que podrá almacenarse correctamente será 4_294_967_295.
Si el resultado de la suma es mayor, harían falta 33 bits para almacenar el resultado correcto, ya que en este caso, al realizar la suma bit a bit empezando por los bits de menor peso, al llegar a los dos bits de mayor peso, su suma más el posible acarreo de la suma anterior habrían dado un resultado, 0 o 1, más un acarreo. Este último acarreo —el «me llevo una» de cuando se suma a mano— no podrá almacenarse en el registro en el que se va a escribir el resultado y, por tanto, el número finalmente almacenado no representará correctamente el resultado de la suma.

## Bit de acarreo
- Para poder detectar que se ha producido un acarreo, bien para avisar que el resultado almacenado no es correcto o para permitir sumas o restas que involucran varias palabras, los circuitos electrónicos
encargados de realizar las operaciones aritméticas suelen proporcionar, además de los bits correspondientes al resultado de la operación, un bit con el valor del acarreo, que recibe el nombre de bit de acarreo.
- El valor de este bit se puede tener en cuenta para saber si el resultado de una suma o una resta de números sin signo puede expresarse en el número de bits disponible. En el caso de la suma, el resultado será correcto si el bit de acarreo vale 0. En el caso de la resta, por el contrario, el resultado será correcto si el bit de acarreo vale 1.

* En cuanto a los números enteros, estos se codifican en un sistema en base a 2 llamado complemento a 2 (Ca2) con un determinado número de bits, el del contenedor en el que vayan a almacenarse.
De nuevo, el tamaño de contenedor se escogerá en función de los valores posibles que pueda tomar el tipo de información representada. Si estos valores están entre -127 y 128 un byte será suficiente.
- **El bit de mayor peso de un número codificado en Ca2 indicará su signo.** Será 0 si es un número positivo, y será 1 si es negativo.

* Cuando se opera con números enteros codificados en complemento a 2 hay que tener en cuenta que el bit de mayor peso indica el signo del número.
Si se suman dos números positivos, el bit de acarreo siempre valdrá 0, y si se operan dos números negativos el bit de acarreo valdrá 1. Lo que ocurrirá cuando el resultado no pueda codificarse correctamente a Ca2 con el número de bits disponibles, es que el bit de mayor peso tendrá un signo distinto al del signo del resultado esperado. Entonces se puede decir que se ha producido un desbordamiento.

## Bit de desbordamiento
Para poder detectar que se ha producido un desbordamiento cuando se opera con números que son Ca2, los circuitos electrónicos encargados de realizar las operaciones aritméticas suelen proporcionar, además de los bits correspondientes al resultado de la operación, un bit que en función de la operación realizada de los bits de signo de los operandos y del signo esperando el resultado, indica si se ha producido o no un desbordamiento. Este bit recibe el nombre de bit de desbordamiento.

# BANCO DE REGISTROS DE ARM
- El banco de registros de ARM se compone de 16 registros visibles por el programador, y un registro de estado. Todos ellos de 32 bits cada uno. De los 16 registros visibles por el programador, los 13 primeros son de propósito general. Por el contrario, los registros r13, r14 y r15 son registros de propósito específico. 
El registro r13 almacena el puntero de la pila; el registro r14 almacena el registro de enlace; el registro 15 almacena en contador del programa.

## Registro de Estado
* Los 8 bits de menor peso contienen información del sistema, tales como estado del procesador y los mecanismos de tratamiento de las insterrupciones. Los 4 bits de mayor peso contienen los indicadores de condición, que son: N, Z, C, V que sirven para indicar distintas propiedades del resultado obtenido tras la ejecución de ciertas instrucciones.
- N. Se activa cuando el resultado de la operación es negativo.
- Z. Se activa cuando el resultado de la operación da a cero.
- C. Se activa cuando el resultado de la operación produce un acarreo.
- V. Se activa cuando el resultado de la operación produce un desbordamiento en operaciones con signo.
__________________________________________________________________________________________________________________________________________________________________________________________________________________

# OPERACIONES ARITMÉTICAS
<<add rd, rs, rn>> suma
<<sub rd, rs, rn>> resta
<<mov rd, rInm8>> Asignación de un valor a un registro.

- Cuando se realiza una operación, el contenido de las variables que están relacionadas en una operación no se mantienen con un valor constante en todo momento. El valor puede cambiar entre una ejecución y la siguiente de la misma instrucción.

### Datos inmediatos
Cuando se quiere realizar una operacion con bits, del 0 al 7, se puede recurrir a los datos inmediatos. Se llaman de la siguiente forma: <<add rd, rs, #Inm3>>. Esta instrucción indica que se realizará una suma entre Inm3 y rs, y el resultado se almacenará en rd. El dato inmediato precede de un <<#>>, esto es porque el dato Inm se llama como un dato literal, y los datos literales en el código deben preceder de un <<#>>.

- Se permite utilizar datos inmediatos con valor de 8 bits en la suma y resta.
<<add rd, Inm8>> suma 
<<sub rd, Inm8>> resta
- Este método de suma o resta, sumando o restando directamente un valor a un registro también se puede hacer con cualquier otra literal.

- Se permite realizar la suma de dos datos, siendo uno de estos un Inm menor a 8 bits.
<<add rd, rs, Imn3>> suma
<<sub rd, rs, Imn3>> resta

### Operación aritmética de comparación
Sin entrar por el momento en detalles, al comparar dos registros se activan o desactivan una serie de indicadores del registro de estado, y en el caso de las instrucciones de control de flujo, el estado de algunos de dichos indicadores se utilizará para fijar el camino a seguir.
En realidad, cuando el procesador ejecuta la instrucción de comparación, lo único que hace es restar sus operandos fuente para que los indicadores de condición se actualicen en función del resultado obtenido, pero no almacena dicho resultado. Así por ejemplo, cuando el procesador ejecuta la instrucción de comparación «cmp r0, r1» resta el contenido del registro r1 del contenido del registro r0, lo que activa los indicadores correspondientes en función del resultado obtenido, que no se almacena en ningún sitio.
<<cmp r0, r1>>

### Operación de cambio de signo
La instrucción que permite cambiar el signo de un número es «neg rd, rs» (rd ← −rs).

### Operación de multiplicación
El siguiente programa muestra un ejemplo en el que se utiliza la instrucción «mul rd, rm, rn», que multiplica el contenido de rm y rn y almacena el resultado en rd —donde rd forzosamente tiene que ser uno de los dos registros rm o rn—. De hecho, puesto que el registro destino debe coincidir con uno de los registros fuente, también es posible escribir la instrucción de la forma «mul rm, rn», donde rm es el registro en el que se almacena el resultado de la multiplicación.
<<mul r1, r0, r1>>

- add
- sub
- cmp
- neg 
- mul
- mov
__________________________________________________________________________________________________________________________________________________________________________________________________________________

# OPERACIONES LÓGICAS
La arquitectura ARM proporciona las siguientes instrucciones que permiten realizar las operaciones lógicas «y» (and), «o» (or), «o exclusiva» (eor o xor) y «complementario» (not), respectivamente.

- and 
- tst
- orr
- xor
- mvn

- «and rd, rs», rd ← rd AN D rs (operación lógica «y»).
- «tst rn, rm», realiza rn AN D rm (operación lógica «y»), actua-
liza los indicadores correspondientes, pero no guarda su resultado.
- «orr rd, rs», rd ← rd OR rs (operación lógica «o»).
- «eor rd, rs»: rd ← rd EOR rs (operación lógica «o exclusiva»).
- «mvn rd, rs»: rd ← N OT rs (operación lógica «complementa-
rio»).

### Escritura de las operaciones lógicas and, tst, orr y xor
La operaciones lógicas Y, O y O exclusiva realizan bit a bit la operación lógica correspondiente sobre los dos operandos fuente, y almacenan el resultado en el primero de dichos operandos. Por ejemplo, la instrucción <<and r0, r1>> almacena en r0 el resultado de la operación lógica.

### Máscara de bits
Cuando se usa una secuencia de bits, ocultando algunos de ellos, esto suele recibir el nombre de **máscara de bits**, ya que oculta determinados bits de otro operando, a la vez que permite ver los bits restantes.
Teniendo en cuenta las tablas de verdad de las operaciones lógicas <<Y>>, <<O>> y <<O exclusiva>>, es posible crear máscaras de bits que usadas en la conjución con la correspondiente operación lógica, pongan determinados bits a 0 y a 1, o los inviertan, respectivamente.

### Operación lógica mvn
La instrucción «mvn rd, rs» permite obtener el complemento bit a bit de un número. Es decir, rdi ← ¬r0i , ∀i ∈ [0, 31]. Esta operación también se denomina complemento a 1 (abreviado como Ca1).
__________________________________________________________________________________________________________________________________________________________________________________________________________________

# OPERACIONES DE DESPLAZAMIENTO
La arquitectura ARM también proporciona instrucciones que permiten desplazar los bit almacenados en un registro un determinado número de posiciones a la derecha o la izquierda.

## Desplazamiento aritmético a la derecha —arithmetic shift right—
* «asr rd, rm, #Shift» desplaza el contenido de rm hacia la derecha conservando su signo, tantas veces como las indicadas por el dato inmediato «Shift», y almacena el resultado en rd (es decir, rd ← rm >>a Shif t).
* «asr rd, rs» desplaza el contenido de rd hacia la derecha conservando su signo, tantas veces como las indicadas por el byte de menor peso de rs (es decir, rd ← rd >>a rs).

## Desplazamiento lógico a la derecha —logical shift right—
* «lsr rd, rm, #Shift» desplaza el contenido de rm hacia la derecha rellenando con ceros por la izquierda, tantas veces como las indicadas por el dato inmediato «Shift», y almacena el resultado en rd (es decir, rd ← Rm >>l Shif t).
* «lsr rd, rs» desplaza el contenido de rd hacia la derecha rellenando con ceros por la izquierda, tantas veces como las indicadas por el byte de menor peso de rs (es decir, rd ← rd >>l rs).

## Desplazamiento lógico a la izquierda —logical shift left—
* «lsl rd, rm, #Shift» desplaza el contenido de rm hacia la izquierda rellenando con ceros por la derecha, tantas veces como las indicadas por el dato inmediato «Shift», y almacena el resultado en rd (es decir, rd ← rm << Shif t).
* «lsl rd, rs» desplaza el contenido de rd hacia la izquierda rellenando con ceros por la derecha, tantas veces como las indicadas por el byte de menor peso de rs (es decir, rd ← rd << rs).

- ars
- lrs
- lsl
__________________________________________________________________________________________________________________________________________________________________________________________________________________

# MODOS DE DIRECCIONAMIENTO Y FORMATOS DE INSTRUCCIÓN DE ARM
*  **La dirección efectiva es la dirección final a la que se accede después de aplicar cualquier ajuste o cálculo necesario**.

* La dirección efectiva es crucial en la ejecución de programas porque determina la ubicación en la memoria donde se almacenan o recuperan datos. En el proceso de ejecución de un programa, los programadores utilizan variables y punteros que se traducen en direcciones efectivas durante la compilación y la ejecución.

* La dirección efectiva es esencial para la correcta ejecución de programas, ya que garantiza que los datos se almacenen y recuperen de la ubicación correcta en la memoria principal. La eficiencia en el manejo de direcciones efectivas es crucial para optimizar el rendimiento y la utilización de la memoria en sistemas informáticos.

## Modos de Direccionamiento
- Una instrucción en ensamblador codifica que operación se debe realizar, con qué operandos fuente y dónde se debe guardar el resultado.
- Los operandos fuente pueden estar en: La propia memoria, en un registro o en la memoria principal.
- Con respecto al operando destino, se ha visto que se puede almacenar en: Un registro o en la memoria principal.

* Puesto que los operandos fuente de la instrucción deben codificarse en la instrucción, sería suficiente dedicar ciertos bits de la instrucción para indicar para cada operando fuente:
El valor del operando, el registro en el que está o la dirección de memoria en la que se encuentra.
De igual forma, puesto que el resultado puede almacenarse en un registro o en la memoria principal, bastaría con destinar otro conjunto de bits de la instrucción para codificar:
El registro en el que debe guardarse el resultado, o la dirección de memoria en la que deben guardarse el resultado.

* **Sin embargo, es conveniente disponer de otras formas más elaboradas de indicar la dirección efectiva de los operandos, principalmente por los siguientes motivos:**
1. Para ahorrar espacio de código. Cuanto más cortas sean las instrucciones máquina, menos espacio ocuparán en memoria, por lo que teniendo en cuenta que una instrucción puede involucrar a más de un operando, deberían utilizarse formas de indicar la dirección de los operandos que consuman el menor espacio posible.
2. Para facilitar las operaciones con ciertas estructuras de datos. El manejo de estructuras de datos complejas (matrices, tablas, colas, listas, etcétera) se puede simplificar si se dispone de formas más elaboradas de indicar la dirección de los operandos.
3. Para poder reubicar el código. Si la dirección de los operandos en memoria solo se pudiera expresar por medio de una dirección de memoria fija, cada vez que se ejecutara un determinado pro- grama, este buscaría los operandos en las mismas direcciones de memoria, por lo que tanto el programa como sus datos habrían de cargarse siempre en las mismas direcciones de memoria. ¿Qué pa- saría entonces con el resto de programas que el computador puede ejecutar? ¿También tendrían direcciones de memoria reservadas? ¿Cuántos programas distintos podría ejecutar un computador sin que estos se solaparan? ¿De cuánta memoria dispone el compu- tador? Así pues, es conveniente poder indicar la dirección de los operandos de tal forma que un programa pueda ejecutarse independientemente de la zona de memoria en la que haya sido cargado para su ejecución.

* **Por todo lo anterior, es habitual utilizar diversas formas, además de las tres ya comentadas, de indicar la dirección efectiva de los operandos fuente y del resultado de una instrucción. Las distintas formas en las que puede indicarse la dirección efectiva de los operandos y del resultado reciben el nombre de modos de direccionamiento.**

## Formatos de Instrucción
Una instrucción en ensamblador codifica que operación se debe realizar, con que ooperando fuente y donde se debe guardar el resultado. 
**Queda por resolver cómo se codifica toda esa información en la secuencia de bits que conforman la instrucción**.
- No se puede utilizar una forma de codificación única y general que pueda ser utilizada por todas las instrucciones. En primera, porque el número de operandos puede variar entre las instrucciones, y el modo de direccionamiento empleado por cada uno de los operandos también puede variar de una istrucción a otra. Si se quisiera usar un método de codificación único para todas las instrucciones, números de operandos y modos de direccionamiento, el tamaño de las instrucciones sería más grande de lo que se requeriría para la tarea que están destinadas a realizar.

* Como no todas las instrucciones requieren el mismo tipo de información, una arquitectura suele presentar diversas formas de organizar los bits de una instrucción, con el fin de optimizar el tamaño requerido por las instrucciones y aprovechar el máximo tamaño disponible para cada instrucción.
**Las distintas formas en las que pueden codificarse las instrucciones reciben el nombre de **formatos de instrucción**.
- Cada formato de instrucción define su tamaño y los campos que lo forman (cuánto ocupan, su orden y su significado). Un mismo formato de instrucción puede ser utilizado para codificar uno ovarios tipos de instrucciones.

### Direccionamiento directo a registro
El operando se encuentra en un registro y en la instrucción simplemente se debe especificar en cuál. Este modo de direccionamiento se usan tanto para transferencia como para la transformación de datos, para algunos o todos sus operandos.
Se usa para las instrucciones <<add>> y <<sub>> en la arquitectura de ARM.

### Direccionamiento inmediato
El operando se encnuentra en la propia instrucción. En la instrucción se debe codificar el valor del operando. Pero este depende del tipo de formato de instrucción que se utilice. Entre las instrucciones que utilizan este modo de direccionamiento están:
«add rd, rs, #Inm3», «sub rd, rs, #Inm3», «add rd, #Inm8» y «sub rd, #Inm8». Son las operaciones de suma y resta, pero haciendo uso de un dato inmediato.

### Formato de las instrucciones aritméticas con tres operandos
El formato de instrucción que se usa para codificar las instrucciones de suma o resta con tres operandos, ya sea con tres registros o con dos registros y un dato inmediato de 3 bits, ocupa 16 bits y está formado, de izquierda a derecha.

### Formato de instrucciones con registro y dato inmediato de 8 bits
«mov rd, #Inm8», «cmp rd, #Inm8», «add rd, #Inm8» y, finalmente, «sub rd, #Inm8»



















