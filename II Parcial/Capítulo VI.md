# INTRODUCCIÓN A LA GESTIÓN DE SUBRUTINAS
En los capítulos anteriores se ha visto una gran parte del juego de las instrucciones de la arquitectura de ARM.
- Las instrucciones de transformación, que permiten realizar operaciones aritméticas, lógicas y de desplazamiento.
- Las instrucciones de carga y almacenamiento, que son necesarias para cargar las variables y almacenar los resultados.
- Las instrucciones de control de flujo, que permiten condicionar la ejecución de determinadas instrucciones o el número de veces que se ejecuta un bloque de instrucciones.

* De hecho, los lenguajes de programación, pueden realizar transformaciones sobre datos, trabajar con variables en memoria e implementar las estructuras de programación condicionales y repetitivas, gracias a que el procesador es capaz de ejecutar las instrucciones vistas hasta ahora.

* Este capítulo introduce otra herramienta fundamental para la realización de programas en cualquier lenguaje: **La subrutina**
Este capítulo se explicará que son las subrutinas, cómo se gestionan a bajo nivel y el soporte que proporciona la arquitectura ARM para su gestión. 
________________________________________________________________________________________________________________________________________________________________________________________________________________

# SUBRUTINA
- Es un fragmento de código independiente, que normalmente realiza una tarea auxiliar completa, a la que se puede llamar mediante una instrucción específica desde cualquier parte de un programa, y que una vez completado su cometido, devuelve el control a la siguiente instrucción a la que había efectuado la llamada. 
- Es habitual que cuando se llame una subrutina se pasen uno o varios datos llamados parámetros, para que la subrutina opere con ellos y realice unas acciones u otras, etcétera.
- También es frecuente que la subrutina, al terminar, devuelva uno o varios resultados a la parte del programa que la llamó.

## ¿Por qué usar subrutinas?
El uso de las subrutinas presenta varias ventajas.
* La primera de ellas es que permite dividir un problema largo y complejo en subproblemas más sencillos. La ventaja de esta división radica en la mayor facilidad con la que se puede escribir, depurar y probar cada uno de los subproblemas por separado. 
- Se puede desarrollar y probar una subrutina independiente del resto del programa y posteriormente, una vez que se ha verificado que su comportamiento es el esperado, se pueden integrar dicha subrutina en el programa que la va a utilizar.

* Otra ventaja de programar utilizando subrutinas es que si una misma tarea se realiza en varios puntos del programa, no es necesario escribir el mismo código una y otra vez a lo largo del programa. Si no fuera posible utilizar subrutinas, se debería repetir el mismo fragmento de código en todas y cada una de las partes del código donde fuera necesario.
- Es más, si en un momento dado se descubre un error en un trozo de código que se ha repetido en varias partes del programa, sería necesario revisarlas todas para rectificar en cada una de ellas el mismo error. 
- De igual forma, cualquier mejora de dicha parte del código implicaría revisar todas las partes del programa en las que ha copiado.
- En caso contrario, si se utiliza una subrutina y se detecta un error o se quiere mejorar su implementación, basta con modificar su código una sola vez.
* **No es necesario saber commo está programado el código de una subrutina para poder utilizarlo en un programa.**
Por esta misma razón, la mayor parte de los depuradores de código y simuladores (incluyendo QtARMSim) incluyen la opciópn de depuración de código paso a paso, y esta opción al pasar por una línea que hace un llamado a una subrutina la ejecuta como si fuera una única instrucción, en lugar de entrar en su código.

### Librerías
* Así pues, la utilización de subrutinas permite reducir tanto el tiempo de desarrollo de código como el de su depuración.
- Sin embargo, el uso de subrutinas tiene una ventaja de mayor calado: **Subproblemas que aparecen con frecuencia en el desarrollo de ciertos programas pueden ser implementados como subrutinas y agruparse en bibliotecas.**
- Cuando un programador requiere resolver un determinado problema ya resuelto por otro, le basta con recurrir a una determinada biblioteca y llamar a la subrutina adecuada. Es decir, gracias a las subrutinas en bibliotecas, el mismo código puede ser reutilizado en muchos programas.

### Facilidades que debe proporcionar la arquitectura del procesador para las subrutinas
1. La llamada a la subrutina.
2. El paso de parámetros con los que debe operar la subrutina.
3. La devolución de los resultados.
4. La continuación de la ejecución del programa a partir de la siguiente instrucción en código máquina a la que invocó a la subrutina

* **Este capítulo presenta los aspectos básicos de la gestión de subrutinas en ensamblador Thumb de ARM: Cómo llamar y retornar a una subrutina y cómo intercambiar información entre el programa que llama a la subrutina y está por medio de los registros.**
________________________________________________________________________________________________________________________________________________________________________________________________________________

# LLAMADA Y RETORNO DE UNA SUBRUTINA
* ARM Thumb proporciona las siguientes instrucciones para gestionar la llamada y el retorno de una subrutina: 
<<bl etiqueta>>
<<mov pc, lr>>

## Instrucción <<bl etiqueta>>
* La instrucción <<bl etiqueta>> se utiliza para llamar a una subrutina que comienza en la dirección de memoria indicada por la etiqueta. Cuando el procesador ejecuta esta instrucción, lleva a cabo las siguientes acciones:
1. Almacena la dirección de memoria de la siguiente instrucción a la que contiene el llamado a la subrutina en el registro <<r14>> (también llamado LR -> Link Register).
Es decir, <<LR <- PC +4>>.

2. Transfiere el control del flujo del programa a la dirección de memoria que indica la etiqueta definida en <<bl etiqueta>>, para poder dirigirse y ejecutar la subrutina. Es decir, se realiza un salto incondicional a la dirección especificada en <<etiqueta>>.
<<PC <- etiqueta>>

## Instrucción <<mov pc, lr>>
* La insntrucción <<mov pc, lr>> se utiliza al final de la subrutina para retornar a la instrucción siguiente a la que había llamado a la subrutina.
- Cuando el procesador ejecuta esta instrucción, actualiza el contador de programa, actualiza el PC con el valor del registro LR, lo que implíca realizar un salto incondicional a la dirección contenida en el registro LR.
<<PC <- LR>>

- En resumen, para que se efectúe una subrutina basta con utilizar las instrucciones <<bl etiqueta>> y <<mov pc, lr>>. Cuando se ejecuta la primera isntrucción lo primero que ocurre es que en el registro LR se guarda la dirección de memoria en la que está esa instrucción, sumando 4 para que se almacene en LR la dirección de memoria siguiente a la que se está realizando el llamado <<LR <- PC + 4>>.
Una vez realizado esto, la misma instrucción realiza un salto incondicional a la dirección de memoria que contiene la etiqueta definida en la instrucción <<bl etiqueta>>.
La última línea de instrucción en la subrutina tiene que ser un cambio en el registro PC, es decir, a PC se le asigna el valor contenido en LR para volver a la instrucción siguiente a la que realiza el llamado de la subrutina <<mov pc, lr>>. Así finaliza la ejecución de la subrutina, y el flujo del programa continúa de forma natural.
________________________________________________________________________________________________________________________________________________________________________________________________________________

# PASO DE PARÁMETROS
- Se denomina paso de parámetros al mecanismo mediante el cual el programa invocador y la subrutina intercambian datos. 
Los parámetros intercambiados entre el programa innvocador y la subrutina pueden ser de tres tipos, según la dirección en la que se transmita la información:
1. Entrada. Proporcionan información del programa invocador a la subrutina.
2. Salida. Devuelven información de la subrutina al programa invocador.
3. Entrada/Salida. Proporcionan información del programa invocador a la subrutina, y devuelven información de la subrutina al programa invocador.

- Por otro lado, para realizar el paso de parámetros en necesario disponer de algún recurso físico donde se pueda almacenar y leer la información que se quiere transferir. Las dos opciones más comunes son los registros o la memoria (mediante una estructura de datos llamada pila). El que utilice registros, la pila o ambos, depende de la arquitectura en cuestión y del convenio adoptado en dicha arquitectura para el paso de parámetros. 

## Convenios Para Paso de Parámetros a las Subrutinas
- Para poder utilizar subrutinas utilizando únicamente su interfaz, pudiendo de esta forma emplear funciones de bibliotecas, es necesario establecer un convenio acerca de como pasar y devolver los parámetros para que cualquier programa pueda utilizar cualquier subrutina, aunque estén programados de forma independiente.

* En este capítulo solo se usará el paso de parámetros por medio de registros, y en este caso, la arquitectura ARM adopta como convenio el paso de parámetros mediante los registros r0, r1, r2 y r3, ya sea para parámetros de entrada, salida o entrada/salida.
- Para los casos en los que se tengan que pasar más de 4 parámetros, el convenio define cómo pasar el resto de parámetros mediante la pila, tal y como se verá en el siguiente capítulo.

* El último aspecto a tener en cuenta con el paso de parámetros es como se transfiere cada uno de los parámetros. 
- Hay dos formas para pasar parámetros:
1. Por valor. Un parámetro se pasa por valor cuando lo que se transfiere es el dato en sí. 
2. Por referencia. Un parámetro se pasa por referencia cuando lo que se transifere es la dirección de memoria en la que se encuentra dicho dato.

* Sobre la base de todo lo anterior, el desarrollo de una subrutina implica determina en primer lugar:
1. El número de parámetros necesarios.
2. Cuáles son de entrada, cuáles son de salida y cuáles de entrada/salida.
3. Si se van a utilizar registros o la pila para su transferencia. 
4. Qué parámetros deben pasarse por valor y qué parámetros por referencia.

* Naturalmente, el programa invocador deberá ajustarse a los requierimientos que haya fijado el desarrollador de la subrutina en cuánto a cómo debe realizarse en paso de parámetros. 
________________________________________________________________________________________________________________________________________________________________________________________________________________

## Paso de Parámetros por Valor
- Un parámetro se pasa por valor cuando únicamente se transfiere su valor. El paso de parámetros por valor implica la siguiente secuencia de acciones:
1. Antes de realizar la llamada a la subrutina, el programa invocador carga el valor de los parámetros de entrada en los registros correspondientes.
2. La subrutina, finalizadas las operaciones que deba realizar y antes de devolver el control al programa invocador, carga el valor de los parámetros de salida en los registros correspondientes.
3. El programa invocador recoge los parámetros de salida de los registros correspondientes.

## Paso de Parámetros por Referencia
- El paso de parámetros por referencia consiste en pasar las direcciones de memoria en las que se encuentran los argumentos. Para pasar los parámetros por referencia, se debe realizar la siguiente secuencia de acciones:
1. Antes de realizar la llamada a la subrutina, el programa invocador carga en los registros correspondientes las direcciones de memoria en las que está almacenada la información que se quiere pasar.
2. La subrutina carga en los registros el contenido de las direcciones de memoria indicadas por los parámetros de entrada y opera con ellos (recordar que ARM no puede operar directamente con los datos en memoria).
3. La subrutina, una vez haya finalizado y antes de devolver el control al programa principal, almacena los resultados en las direcciones de memoria proporcionadas por el programa invocador.

## Paso de Parámetros, ¿Por valor o por Referencia?
- Una vez descritas las dos formas de paso por parámetros a una subrutina, queda la tarea de decidir cuál de las dos formas (por referencia o por valor) es más conveniente para cada parámetro.
- **En la práctica, se debe analizar para cada parámetro cuál es la forma idónea de realizar el paso**. Esto implica que por regla general no todos los parámetros de una subrutina utilizarán la misma forma de paso.

## Convenios del Tipo de Pasos de Parámetros para los Tipos de Datos
* De hecho, la decisión de cómo pasar los parámetros a una subrutina viene condicionada en gran medida por la estructura de datos de los parámetros que se quieren pasar. 
1. **Si se trata de un dato de tipo estructurado** (vectores, matrices, cadenas, estructuras), que tienen tamaño indeterminado y solo pueden residir completos en memoria, no hay alternativa posible, **el paso siempre se hace por referencia**. Independientemente de si el parámetro en cuestión es de entrada, salida o entrada/salida.
2. En cambio, **si el dato que se quiere pasar es de tipo escalar** (un número entero, un número real, un carácter), que puede estar contenido temporalmente en un registro, entonces si **se puede decidir si se pasa por valor o por referencia**. 
Hacerlo de una forma u otra depende entonces del sentido en el que se va a transferir el parámetro, es decir, si se trata de un parámetro de entrada, de salida o de entrada/salida. 
________________________________________________________________________________________________________________________________________________________________________________________________________________

* **La siguiente lista muestra las opciones disponibles según el tipo de parámetro:**

1. **Parámetro de entrada**. Un parámetro de este tipo es utilizado por la subrutina pero no debería ser modificado, por lo que **es preferible pasar este tipo de parámetros por valor**.

2. **Parámetro de salida**. Un parámetro de este tipo permite a la subrutina devolver el resultado de las operaciones realizadas. Para este tipo de parámetros se puede optar por cualquiera de las opciones: **El parámetro puede devolverse por valor o por referencia**.
- Si el parámetro de salida se pasa por valor, la subrutina devuelve el dato utilizando el registro reservado para ello.
- Si el parámetro de salida se pasa por referencia, la subrutina almacenará en memoria el dato, pero para ello el programa invocador deberá haberle pasado previamente en qué dirección de memoria deberá almacenarlo.

3. **Parámetro de entrada/salida**. Un parámetro de este tipo proporciona un valor que la subrutina necesita conocer y en el posterior devolverá el resultado. En este caso, **se debe pasar por referencia**.

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





























