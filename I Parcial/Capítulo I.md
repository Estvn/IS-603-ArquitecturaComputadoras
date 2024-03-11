Los primeros procesadores que se producieron se componían de pocos transistores (decenas de miles), y eran utilizados para tareas especificas por su poca capacidad en el procesamiento de tareas.
Los procesadores actuales se componen de miles de millones de transistores, tienen una arquitectura más compleja, son más rápidos y más económicos. 
Los procesadores actuales pueden ser utilizados en distintos campos, realizan diferentes tipos de tareas gracias a la capacidad actual que tienen.

# COMPONENTES DE UN ORDENADOR
- Modelo de funcionamiento de los ordenadores - Von Neumann (1945)
El núcleo del ordenador transforma y modifica datos que tiene almacenados, dirigido por una sucesión de ordenes que es capaz de interpretar, y que también están almacenadas en él.
Este conjunto de órdenes y datos constituye lo que se conoce como programa.

Un ordenador es capaz de modificar y transformar datos para ejecutar tareas. También dispone de un conjunto de elementos que hacen posible su interacción con el mundo exterior, lo que lo permite recibir datos, órdenes y comunicar los resultados. 

* El funcionamiento de un ordenador se deduce que contiene las siguientes tres clases de elementos, con funciones claramente diferenciadas:

1. El núcleo del ordenador, también conocido como procesador, es el elemento capaz de encontrar, entender y realizar las intrucciones de un programa.
Se puede decir que el procesador es el elemento del ordenador capaz de ejecutar las instrucciones codificadas en un programa, encontrando los datos que se van a transformar y almacenando el resultado de dicha transformación.
Genera la señales eléctricas necesarias para coordinar el funcionamiento de todo el sistema.

2. La memoria es el elemento que almacena los datos y las instrucciones de un programa. 
Se compone de una colección ordenada de recursos de almacenamiento de manera que cada uno de ellos se identifica por una dirección. 
Cuando la memoria de un ordenador almacena de forma indistinta datos e instrucciones, se dice que dicho ordenador tiene una arquitectura Von Neumann.
Si existe una memoria específica para almacenar los datos, y otra distinta para las instrucciones, se dice que el ordenador presenta una Arquitectura Hardvard.
Independientemente, del tipo de arquitectura elegida, el funcionamiento de la memoria en los ordenadores es el mismo. 

3. E/S. Está formada por el conjunto de componentes que permiten relacionar un ordenador con el mundo exterior.
La comunicación del ordenador con los dispoisitivos externos es muy compleja y variada a causa de la variedad de dispositivos que pueden comunicarse con el ordenador, y no todas implican la comunicación de datos entre el ordenador y los usuarios. 

El procesador ejecuta un programa, o secuencia de instrucciones almacenadas en memoria para realizar transformaciones adecuadas de un conjunto de datos que también se encuentran almacenados en memoria.
La ejecución de las intrucciones de los programas por el procesador permiten la lectura de datos, la presentación de resultados y en general, la communicación con el exterior que se realiza a través de la entrada y salida (E/S).
_____________________________________________________________________________________________________________________________________________________________________________________________________________

# EL PROCESADOR, EL NÚCLEO DEL ORDENADOR
El procesador es el componente principal del ordenador. Es capaz de interpretar órdenes y generar señales de control, que con algunos intermedios, rigen el funcionamiento de todo el sistema.
El conjunto de todas las instrucciones que es capaz de ejecutar es lo que determina las características del sistema y la esructura de los programas. El tamaño y la forma de organizar la memoria, la manera de interactuar con la E/S viene también determinado por el procesador.
* El procesador establece las características propias diferenciales de cada ordenador, lo que se denomina como **Arquitectura**.

## Tipos de procesadores
* Procesadores de Altas Prestaciones. Se utiliza tando para ordenadores personales como para ordenadores destinados al cálculo masivo.
La prioridad en el diseño de estos procesadores es la ejecución de la mayor cantidad de instrucciones u operaciones por segundo.
El juego de instrucciones de este tipo de procesadores suele ser muy amplio y frecuentemente proporciona recursos que facilitan al sistema operativo la gestión avanzada de la memoria y la gestión de la multitarea. 

* Procesadores de Alta Eficiencia Energética. Están destinados para los dispositivos alimentados mediante baterías (teléfonos inteligentes), y que tienen el ahorro energético como uno de sus objetivos de diseño.
Lor principales representantes de este tipo de procesadores son los de arquitectura ARM. Algunas versiones de esta arquitectura están específicamente diuseñados para trabajar con pocos recursos, optimizar el tamaño de las intrucciones para ahorrar espacio en la memoria y disponer de un juego de instrucciones simple y sencillo.

### Microprocesador
Es un procesador implementado popr medio de un circuito integrado

### Microcontrolador
Es un circuito integrado que incorpora el procesador y las partes restantes del ordenador, todo esto en un mismo circuito integrado.
Los microcontroladores están orientados para realizar tareas muy concretas, por ejemplo, el control de frenado de un vehículo, o las tareas de un electrodoméstico cualquiera.
Puesto que los microcontroladores son muy variables en cuanto a requisito de ejecución, ls fabricantes de los microcontroladores suelen ofrecer una amplia gama de modelos con diferentesd prestaciones para que el usuario pueda elegir un microcontrolador que se acople a las necesitades de la aplicación a la quie va a ser utilizado.

# PARTES DEL PROCESADOR
Para explicar como el procesador realiza sus funciones, se debe considerar que este está compuesto de dos partes:
1. Unidad de Control. Es la encargada de generar y sencuenciar las señales eléctricas que sincronizan el funcionamiento tanto del propio procesador, mediante señales internas del circuito integrado, como del resto del ordenador, con líneas eléctricas que se propagan al exterior a través de sus pines de conexión.

2. Camino de Datos. Está formado por las unidades de transformación y transferencia de datos. Es el responsable de realizar, almacenar y transportar operaciones con los datos, siguiendo la coordinación de la unidad de control.

Aunque la división en unidad de control y el camino de datos es más conceptual que física, es fácil identificar los bloques que pertenecen a cada una de estas partes dentro del procesador. 

**Elementos estructurales más importantes dentro de un procesador**:
## Registros
Son elementos de almacenamiento propios del procesador. 
Así como la memoria que es un elemento externo al procesador que permite almacenar gran cantidad de datos e instrucciones, los registros constituyen de un elemento interno de almacenamiento que permite almacenar una pequeña cantidad de información. 
La limitación en la cantidad de información que puede almacenar los registros es debida a que el número de registros dentro de un procesador es muy pequeño.

Gracias a que son un elemento interno del procesador, y que el número de registros es limitado, el acceso a la información almacenada en ellos es mucho más sencillo y rápido que el acceso a la memoria.

**Los registros pueden clasificarse según su visibilidad en:**
* Registros de uso interno. Son registros usados internamente por el procesador, son necesarios para su funcionamiento, pero no son visibles por el programador.
* Registros visibles por el programador. Son aquellos registros que pueden ser manipulados explícitamente por el lenguaje máquina.

Sean independientemente registros de uso interno o visibles por el programador pueden ser clasificados según su funcionalidad en:
* Registros de propósito específico. Tienen asignada una función/propósito específico. Algunos de estos registros pueden ser: Contador de programa, registro de instrucción y de estado.
* Registros de propósito general. Son registros que no tienen un cometido predefinido, y se usan como almacenamiento temporal de los datos que se están procesando en un momento dado.

## Unidades de Transformación
Permiten realizar operaciones con los datos.
Son circuitos electrónicos que generan un resultado en función de uno o varios datos iniciales. 
Todos los procesadores cuentan con una **Unidad Aritmético-Lógica (ALU)**, que suele operar con dos datos de entrada, y que es capaz de realizar sumas, restas y las operaciones bit a bit más comunes.

En las unidades de transformación también se encuentran en los procesadores las unidades de desplazamiento que entrega a su salida rotaciones o desplazamientos de un número de bits dado del valor presente a su entrada.
**Además de estos, es frecuente encontrar unidades que realicen la multiplicación o división de datos enteros, todo tipo de operaciones sobre datos en coma flotante, u operaciones más especializadas sobre vectores de datos para tratamiento de señal, multimedia, gráficos, etc.**

## Circuitos Digitales y Secuenciadores
Se encargan de generar, transformar y distribuir las señales de control que sincronizan la ejecución de las instrucciones, y en general, el funcionamiento del sistema.

## Buses
Están compuestos por un conjunto de líneas conductoras que conectan distintos componentes del procesador por los que fluye la informmación, como los registros y las unidades de transformación. 
Tanto las señales de control como los datos que transforma un procesador con considerados, lógicamente como valores binarios de varios bits que se almacenan y distribuyen también como señales eléctricas a través de estas líneas.
Dado el número y el tamaño de los registros y la gran cantidad de unidades funcionales de los procesadores de hoy en día, los buses constituyen una parte importante del procesador. Y también en el resto del ordenador donde se realizan funciones similares.
______________________________________________________________________________________________________________________________________________________________________________________________________________

# EJECUCIÓN DE INSTRUCCIONES
Cuando se enciende un ordenador, sus circuitos activan de forma adecuada la señal de inicio del procesador, lo que se conoce como **reset**.
El procesador comienza a funcionar, y tras un proceso de configuración interna, ejecuta la primera instrucción ubicada en una dirección predeterminada de la memoria, que se conoce como **dirección o vector reset**.
A partir de este momento, y hasta que se detiene su funcionamiento, el procesador no hace otra cosa que ejecutar instrucciones una tras otra, e ir transformando y moviendo los datos de acuerdo con las instrucciones ejecutadas.
**Para entender como funciona un procesador, basta con saber como se ejecutan las intrucciones y el resultado que produce sobre los datos del sistema, la ejecución de cada una de ellas.**

## Fases de Ejecución
Independientemente de la operación que realicen, todas las instrucciones se ejecutan siguiendo una serie de pasos que se conocen como **fase de ejecución.**
Estas fases son generales para todos los procesadores, aunque puede haber algunas diferencias en los modelos de procesadores, sobre todo en como afecta el temporizador.

**Ciclo de instrucción/Fase de ejecución:**
1. Lectura de la instrucción. El procesador mantiene en uno de los resgistos (contador de programa) la dirección de la próxima instrucción que se debe ejecutar.
En esta fase, el procesador envía a la memoria la dirección guardada en el contador del programa, mediante los buses de interconexión externos al procesador. Y la memoria responde enviando al procesador los datos de la instrucción que se va a ejecutar. Esto también se le conoce como **búsqueda de instrucción**.

Una instrucción especifica ciertas acciones que debe llevar a cabo el procesador. Ejecutar una instrucción implíca realizar efectivamente la ejecución de esas acciones. La propia instrucción contiene información acerca de sus operandos, transformación, etc.

2. Decodificación de la instrucción. El procesador almacena la instrucción recibida de la memoria en el registro de instrucciones.
Luego, los circuitos de control que forman parte de la unidad de control interpretan la instrucción y generan una secuencia de señales eléctricas que permiten decodificar la instrucción de forma específica.
En algunos procesadores, esta decodificación no consume tiempo, puesto que las señales eléctricas están preparadas para ser guiadas por los bits de la propia instrucción.

3. Incremento del contador del programa. El procesador ejecuta instrucciones de forma constante. Al terminar de ejecutar una instrucción se debe hacer un incremento en el contador del programa para poder realizar la ejecución de la siguiente instrucción.

4. Ejecución de la instrucción. Las fases anteiores son generales para todas las intrucciones, pero donde difiere el ciclo de instrucción es en la parte de ejecución.
**Etapas en la ejecución de una instrucción:**
4.1. Lectura de los operandos. Se hace una lectura a los datos fuente de la instrucción. 
4.2. Ejecución. Se realiza la transformación de los datos leídos en una de las unidades del procesador. Se realiza una operación aritmética o alguna acción con los datos que se leyeron.
4.3. Escritura de resultados. El resultado de la ejecución anterior se almacena en algún recurso de almacenamiento.

Una vez realizadas todas estas fases, el contador del programa se incrementa, y asimismo conteniendo la dirección de la nueva instrucción para repetir el ciclo. El procesador realiza este ciclo con cada instrucción que llega hasta que se apaga la fuente de energía o se detenga el funcionamiento del ordenador.
______________________________________________________________________________________________________________________________________________________________________________________________________________

# TIPOS DE INSTRUCCIONES
Las instrucciones que puede ejecutar un procesador se puede clasificar en un conjunto reducido de tipos de instrucciones. Como los tipos de instrucciones soportados por los procesadores suelen ser los mismos, uno de los aspectos que diferencia la arquitectura de los procesadores es el número y la forma de las intrucciones que pueden ejecutar.

1. Instrucciones de transformación de datos. Son las instrucciones que realizan operaciones sobre los datos en alguna de las unidades de transformación del procesador.
Como estas instrucciones tienen datos de entrada y generan resultados, así que son fieles a las fases de ejecución de una instrucción.
EL número y el tipo de instrucciones que implemente del procesador dependerá de la cantidad de unidades de transformación de las que dispone.

2. Instrucciones de transferencia de datos. Son las instrucciones encargadas de copiar los datos de unos recursos de almacenamiento a otros.
Lo común es que se transfieran datos entre los registros y la memoria y viceversa. Las instrucciones que intercambian datos entre los dispositivos de E/S también pertenecen a esta categoría.

3. Intrucciones de control de flujo del programa. Son las que permiten alterar el orden de ejecución de un programa. 
El procesador realiza ejecución de instrucciones de forma secuencial. Pero este tipo de instrucciones es capaz de alteral el contador del programa para modificar el flujo de ejecución de las instrucciones, y provoca que la ejecución de un programa no sea estrictamente secuencial. 

Este tipo de instruciones también se conocen como **instruciones de control de flujo de programa, o instrucciones de salto**, cuya finalidad es modificar el contenido del contador de programa con la dirección efectiva de la memoria hacia donde se quiere desviar la ejecución de un programa. 
Este tipo de instrucciones permiten implementar estructuras condicionales de programacion (if, else, switch, while). 

4. Instrucciones de control del procesador. Son instrucciones capaces de cambiar el modo de funcionamiento del procesador. Por ejemplo, entrar en modo de bajo consumo de energía y funcionamiento, habiliutación de interrupciones, forma de gestionar la memoria
Este tipo de instruciones se relacionan con la arquitectura de cada procesador y se usan normalmente en el código del SO, rara vez en programas de aplicación.

## Codificación de instrucciones
La instrucción en si, es un tipo de información que puede ser almacenada en memoria, y debe contener indicaciones acerca de:
La operación que debe realizar el procesador.
Sus operandos fuente.
El destino del resultado.

La memoria almacena digitos binarios, llamados bits, agrupados en grupos de 8 bits denominados **bytes**.
Cada una de las intrucciones que el procesador es capaz de interpretar se codifica utilizando un cierto número de bytes.

##  Formatos de instrucción
El grupo de bytes que constituye unna determinada instrucción de una arquitectura dada se codifica siguiendo un formato concreto que se define durante el diseño de dicha arquitectura.
Un formato de instrucción determina como codificar la información que contiene una instrucción, especificando los campos en los que se divide el conjunto de bits que forman dicha instrucción, tamaño y contenido de cada campo.
Estos campos son: lo que hace la instrucción, y los operandos fuente y destino, que se especifican mediante lo que se conoce como modos de direccionamiento.

* Las instrucciones, vistas como valores o conjuntos de bytes en memoria, son el nivel de abstracción más bajo de los programas, lo que se conoce como **Código o lenguaje máquina.**
* Sin embargo, tanto el procesador como las instrucciones han sido diseñadas por los seres humanos, por lo tanto, también han diseñado una traducción del lenguaje máquina comprensible para los programadores, conocido como **lenguaje ensamblador.**
Cada instrucción en lenguaje ensamblador corresponde a una instrucción en lenguaje máquina. En ensamblador es texto legible en lugar de bytes de memoria.

**El lenguaje ensamblador suele proporcionar más instrucciones que las estrictamente soportadas por la arquitectura. Estas instrucciones adicionales, denominadas pseudoinstrucciones, facilitan la labor del programador porque pueden dar lugar a una o más instrucciones máquina.**
______________________________________________________________________________________________________________________________________________________________________________________________________________

# MODOS DE DIRECCIONAMIENTO
Los modos de direccionamiento, del tipo que sean, indican las formas mediante las cuales se emplean ciertos bits de las instrucciones para que el procesador pueda obtener los datos fuente o saber donde almacenar el destino de las operaciones.

Los operandos con los que trabaja una instrucción puede residir en 3 lugares:
- En la propia instrucción.
- En registros del procesador.
- En la memoria.

Además de conocer en que campo se encuentra cada operando, es necesario saber cómo se codifica en dicho campo la dirección efectiva en la que se encuentra el operando.
El formato de intrucción, además de especificar los campos en los que se divide el conjunto de bits que forman la instrucción, el tamaño y el contenido de cada campo, también indica como codificar la dirección efectiva de cada uno de los operandos de la instrucción.
**Se denomina dirección efectiva a la dirección que acaba calculando el procesador y que indica la ubicación del operando.**

## Modos de Direccionamiento
Son las distintas formas en las que se puede indicar la dirección efectiva de un operando.
Los modos de direccionamiento que referencian datos constantes o contenidos en registros son sencillos.
Los modos de direccionamiento que referencian datos en memoria son variados y de gran complejidad.

* Modo de direcionamiento inmediato. Es aquel en el que el operando está codificado en la propia instrucción.
Las ventajas de este modo de direccionamiento son que el operando está disponible desde el mismo momento en el que se lee la instrucción, y no es necesario dedicar un registro o posición de memoria para almacenar dicho operando.

* Modo de direccionamiento directo a registro. Indica que el operando se encuentra almacenado en un registro de la arquitectura, pudiendo usarse de este modo para los operandos fuente como destino.
Los registros de un procesador suelen estar enumerados internamente, lo que es evidente en el lenguaje ensamblador de ARM y no tanto en Intel (aunque realmente si lo estén).
Una de las ventajas de usar registros para almacenar operandos, es que la referencia a un registro consume muy pocos bits de código de instrucción, comparado con el tamaño del operando contenido en el registro.

* Modo de direccionamiento directo a memoria o absoluto. Es el modo más evidente para referise a datos en la memoria.
La instrucción incorpora en el campo correspondiente la dirección de memoria del operando, que puede ser fuente o destino.
El consumo de bits de la instrucción de este modo de dirección es muy elevado, por lo que es más común que se proporcione en arquitecturas con tamaño de instrucción variable.
También puede encontrarse en arquitecturas con tamaño de instrucción variable, aunque a estos casos se le aplican restricciones a las zonas de memoria accesibles.

* Modo de direccionamiento implícito. Algunas de las instrucciones se refieren a algunos de sus operandos sin necesidad de indicar donde se encuentran estos en ninguno de sus campos, dado que están implícitos en la propia instrucción.

* Modo de direccionamiento indirecto con registro. Permite referirse a datos en memoria consumiendo los bits necesarios para indicar un registro.
Los bits de la instrucción indican el número de un registro, cuyo contenido es la dirección de memoria en la que se encuentra el operando, que puede ser fuente o destino.

## Derivaciones del direccionamiento indirecto con registro
* Modo de direccionamiento indirecto con desplazamiento. En este modo, en la instrucción es especifíca, además de un registro, una constante que se suma al contenido de aquel para formar la dirección de memoria en la que se encuentra el operando.

* Modo de direccionamiento relativo al contador del programa. Es el modo en el que el registro es el contador del programa. Se usa en las instrucciones de salto para indicar la dirección destino de salto.

* Modo de direccionamiento indirecto con registro de desplazamiento. La instrucción se especifíca en dos registros, la suma de los contenidos en los cuales da la dirección de memoria en la que está el operando.

* Modo de direccionamiento base más indice con desplazamiento. La dirección de memoria del operando se calcula sumando el contenido de los dos registros, posiblemente multiplicando el índice como se ha comentado anteriormente, más la constante.
______________________________________________________________________________________________________________________________________________________________________________________________________________

# ARQUITECTURA Y ORGANIZACION DEL PROCESADOR
El término arquitectura en el campo de los ordenadore hace referencia a su modelo de funcionamiento.
La arquitectura de un ordenador especifíca el modo de comportarse y funcionar con el objetivo de realizar programas correctos en ese ordenador.
La arqwuitectura de un procesador especifíca como funciona un procesador incluyendo todos los aspeectos necesarios para poder realizar programas correctos en el lenguaje ensamblador.
**La arquitectura de un ordenador depende mucho de la arquitectura del procesador en muchos aspectos.** Pero existen varias diferencias entre ambos.

- El conjunto de las instrucciones es la manera más objetiva y completa de especificar como se comporta el procesador a la hora de ejecutar los programas. Por tanto hay que identificar que características de las instrucciones hay que tener en cuenta al programarlas.

## Características Fundamentales de la Arquitectura del Conjunto de Instrucciones
Estas características están relacionadas entre sí, porque todas definen el funcionamiento del procesador.

1. Tipos de instrucciones. Hay distintos tipos de instrucciones que conforman el conjunto de operaciones que es capaz de realizar un procesador y que define en buena medida su arquitectura.
Además de las operaciones de transformación, que vienen dadas por las unidades funcionales, se tienen también los tipos y forma de los saltos, las maneras de acceder a memoria y a la entrada/salida, etcétera.

2. Tipos de datos. Los tipos de datos con los que trabaja el procesador también son una parte importante de la arquitectura de los procesadores. Además de los distintos tamaños de enteros con los que es capaz de operar, determina si trabaja con datos en coma flotante, o si es capaz de interpretar, mediante sus instrucciones, otros formatos de datos. 

3. Registros de la arquitectura. El tamaño y el número de registros en el procesador es un parámetro fundamental, porque el tamaño de los registros define el tamaño de la arquitectura, y da una aproximación cualitativa de la potencia del procesador.
El tamaño de los registros también define el espacio de las direcciones del procesador, pues las direcciones en memoria se guardan en los registros durante la ejecución de sus programas. 

4. Formato de las instrucciones. Determina como se codifican las instrucciones e indica el número y tipos de operandos con los que trabaja las arquitecturas. 

5. Modos de direccionamiento. Indican la flexibilidad con la que la arquitectura accede a los operandos, sobre todo en la memoria.
Tener una gran variedad de modos de direccionamiento de mucha versatilidad, pero a costa de una mayor complejidad en el procesador y en los formatos de instrucción.
Tener pocos modos de direccionamiento requerirá utilizar más instrucciones cuando sea necesario, y efectuar los tipos de acceso que no son soportados por esos modos. Pero esta restricción simplifica el diseño del procesador y facilita el diseño de formatos de instrucción simples de tamaño fijo.

## Instrucciones y programas (Capítulo 1.2.7 saltado)
La función de un ordenador, por lo tanto, de un procesador es la ejecución de programas de aplicación que lo doten de utilidad.

Antes de los lenguajes de programación de alto nivel el lenguaje ensamblador se usaba para diseñar programas de computadora, y que fueran compatibles a la arquitectura del procesador. Cada programa de rediseñaba para cada arquitectura. La llegada de los lenguajes de programación de alto nivel simplificó este trabajo. Se pudo diseñar programas independientes de la arquitectura del procesador, el compilador de los lenguajes de programación era una herramienta esencial para lograr que los programas pudieran ejecutarse en los ordenadores, dejando aparte la dependencia del programa con la arquitectura de la máquina.
Los lenguajes de programación de alto nivel fueron herramientas para hacer el diseño de las próximas generaciones de los procesadores.

* RISC (Reduced Instruction Set Computer). Surgieron debido a la complicación para adaptar el diseño de los procesadores con los lenguajes de alto nivel. Tienen circuitos más simples y ciclos de reloj menores, para ejecutar las instrucciones en menos tiempo.
* CISC (Complex Instruction Set Computer). Se usa para diseño de procesadores que requieren la ejecución de más instrucciones para realizar las mismas tareas que un RISC.

# INTRODUCCIÓN A LOS BUSES
- Los buses son un conjunto de conductores eléctricos por los que se inntercambia información entre dos o más dispositivos electrónicos digitales.
La información que circula a través de un bus necesita de la participación de todas las líneas conductoras que lo conforman, por lo tanto, se considera lógicamente como un conjunto único de bus.

- Explicando los buses de forma más técnica, son unn conjunto de conductores eléctricos por el que se intercambia información, mediante un protocolo adecuadamente especificado.
Las líneas de los buses para por procesos de sincronización, transmisión, recepción, etc. Esto es lo que se conoce como **protocolo de bus**.

* El bus principal del sistema es el bus que utiliza el procesador para interactuar con el resto de elementos principales del ordenador. En algunos procesadores este se gestiona a través del bus del procesador. Como el procesador se encarga de generar la señales eléctricas para el funncionamiento del ordenador, el procesador inicia todas las transacciones del bus a la que los demás dispositivos responden.
**El procesador es el único maestro del bus del sistema, del que todos los demás dispositivos son esclavos.

* El procesador, guiado por la ejecución de las instrucciones, debe indicar al exterior: La dirección a la que dirige el acceso ,si se trata de lectura o escritura, el tamaño en bytes de los datos a los que quiere acceder.
* **El bus del procesador necesita tres tipos de información para realizar un acceso:**
1. La dirección generada y puesta en el bus del procesador.
2. Los datos, que los pondrá el procesador o la memoria, o algún tipo de E/S en el bus, según se trate de un acceso a la lectura o escritura.
3. Algunas señales de control para indicar las características del acceso y para pautar la sincronización de acuerdo con el protocolo del bus.

### **Según esta información, los buses se diferencian en tres tipos de líneas: DIRECCIONES, DATOS Y CONTROL.**
- Las líneas de dirección permiten la selección de los dispositivos sobrelos que se va a realizar el acceso.
- Las de datos transfieren la información que se va a intercambiar entre los distintos componentes.
- Las de control indican cómo se lleva a cabo la transferencia.

# LA MEMORIA 
Es el dispositivo que, en la arquitectura Von Neumann, almacena las instrucciones y los datos de los programas en ejecución. 
La memoria principal también es un dispositivo de almacenamiento, al igual que los discos duros, aunque estos sean de almacenamiento secundario.
**La memoria principal es el dispositivo que almacena las instrucciones y los datos de los programas en ejecución, es decir, aquellos con los que está trabajando el procesador.**

- A través del bus del procesador se generan los accesos de lectura o escritura a los que la memoria responde entregando o recibiendo datos. Cuando se realiza una lectura, la memoria entrega el dato que tiene almacenado en la dirección en la que se haya indicado.}
En el caso de una escritura, la memoria almacena el dato que se le suministra en la dirección que se ha proporcionado.
- La memoria es una colección ordenada de recursos de almacenamiento, de manera que cada uno de estos recursos está identificado por una dirección. 

- **El elemento básico de almacenamiento en la memoria es el byte (8 bits)**
De esta forma, cada dirección de la memoria se asocia con un byte, y la unidad mínima de lectura o escritura en la memoria es el byte.
Sin embargo, las instrucciones y los registros en la mayor parte de las arquitecturas se componen de más de un byte, es por eso que la mayoría de los accesos a la memoria se componen de conjuntos de bytes, de un tamaño u otro según la arquitectura.

- Los buses de los procesadores suelen tener suficientes líneas de datos para intercambiar a la vez tantos bits como tienen los registros de la arquitectura.
De esta manera, un acceso indica en el bus de direcciones la dirección del byte más bajo disponible en la memoria, y mediante otras señales de control, cuantos bytes de datos van a instervenir en el acceso. 
Esto obliga a que en las direcciones disponibles que aparezcan en el bus siempre sean múltiplos del número máximo de bytes que se pueden transferir en paralelo.
**Así, si se quiere hacer un envío del número máximo de bytes en un solo acceso, deberá hacerse desde una dirección de memoria que sea múltiplo de este número.**
Si no se hace así, será necesario efectuar una transacción para la primera parte del dato, y otra para la parte restante. 
### Este concepto es lo que se conoce como alineamiento de datos.
Se dice que un dato está alineado en la memoria si este comienza en las dirección de memoria que sea múltplo de su tamaño máximo en bytes.

Muchas arquitecturas trabajan con datos alineados en la memoria, otras permiten el almacenamiento de datos desalineados, pero los accesos a la memoria serán necesariamente más lentos.

* **Litte Endian. Si el byte de menor peso es el que ocupa la dirección en memoria más baja, esta forma de almacenar datos se conoce como Litte Endian,** pues se accede a la cantidad por su extremo menor. 
* **Big Endian. Si se sitúa el byte de mayor peso en la dirección de memoria más baja, la forma de almacenamiento se denomina Big Endian, **

- La memoria se considera un bloque único de bytes, desde la dirección mínima hasta la máxima, donde el rango de direcciones depende del procesador. 
En un ordenador/sistemas hay distintos tipos de memoria, con diferentes tecnologías y usos. Podemos encontrar memoria no volátil, normalmente llamada ROM, que almacena código de arranque y otras rutinas básicas del sistema. Y la memoria RAM para los datos, SO y programas de aplicación; direcciones ocupadas por dispositivos de entrada/salida e incluso zonas de memoria no utilizadas.

La memoria direccionable de un ordenador está poblada por dispositivos de memoria de diferentes tecnologías e incluso en algunos casos, por dispositivos de E/S.
El mapa de memoria del ordenador, que configura el espacio de direcciones del procesador con los dispositivos presentes en el sistema real.
______________________________________________________________________________________________________________________________________________________________________________________________________________

# ARQUITECTURAS VON NEUMANN Y HARDVARD
* Von Neumann. Toda la información se guarda en un solo bloque de memoria. No existe diferencia en el almacenamiento de datos e instrucciones.

* Hardvard. Esta arquitectura mantiene dos memorias separadas, una para las instrucciones y otra para los datos. Es la arquitectura más utilizada hoy en día.
La ventaja de esta arquitectura esque el procesador puede ir ejecutando la próxima instrucción antes de terminar la actual. Tiene una memoria de instrucciones separada de la de datos, y lo mismo pasa con el acceso de los buses. De esta forma el procesador puede acceder y tomar infromación de la memoria de datos mientras ejecuta una instrucción y a la vez toma la siguiente instrucción del bloque de memoria de instrucciones para ejecutarla.
Buena parte de los procesadores de propósito general y algunos microcontroladores hacen uno de la arquitectura Hardvard, porque pueden ejecutar instrucciones de forma solapada y con mayor velocidad.

# JERARQUÍA DE LA MEMORIA
**La memoria caché, la memoria ROM y la principal consituyen lo que se conoce como jerarquía de la memoria en algunos sistemas.**

Los procesadores tienen una capacidad de trabajo muy rápida, y la memoria principal del sistema es varias veces más lenta que el procesador.
Para solucionar este problema, que se conoce como cuello de botella de la memoria, se añadió la memoria caché. 
- La memoria caché, que tiene la misma velocidad que el procesador, mantiene copias de los datos e instrucciones de memoria principal próximos a los que está accediendo el procesador con mayor frecuencia.
Cuando el procesador debe acceder a un dato a instrucción que no se encuentra en la caché, la caché copia de la memoria principal toda la información cercana, ya que el procesador la necesitará en breve.

Cuando la memoria caché no tiene más espacio para almacenar nuevos datos se aplican técnicas de sustitución y reemplazo de datos gestionados por el mismo hardware de la memoria caché.
Cuando la memoria principal no tiene más espacio se aplica el mecanismo de memoria virtual, gestionado por el SO. Con este mecanismo se expande de forma virtual la memoria principal, recurriendo a un bloque de direcciones de la memoria secundaria para simular más espacio en la memoria principal. 
La sección de memoria virtual se usa para los datos e instrucciones de programas que llevan más tiempo sin tener actividad en los bloques de memoria principal, con lo que se libera memoria para almacenar otros programas.

En los procesadores con varios núcleos se pueden aplicar varios niveles de memoria caché. El primer núcleo del procesador, el más rápido, es propio de cada núcleo, y suele separar datos e instrucciones de los programas haciendo uso de la arquitectura hardvard.
Los demás núcleos, los más lentos, suelen ser unificados y compartidos por todos los núcleos. A partir de ahí el procesador se comunica a través de su bus con una única memoria principal para los datos e instrucciones, aplicando la arquitectura Von Neumann 
En los ordenadores con multiprocesadores suele ser posible instalar un SO con soporte para la gestión de la memoria virtual que hace uso del disco.































