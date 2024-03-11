# ELEMENTOS BÁSICOS
* Procesador. Controla el funcionamiento del computador y realiza sus funciones de procesamiento de datos.
* Memoria Principal. Almacena datos y programas. Su contenido es volátil, cuando se apaga la máquina, esta memoria pierde elc contenido que contenía. 
A diferencia de la RAM, La memoria de disco (ROM) tiene contenido almacenado, ya si la máquina se encuentra encendida o no.
* Módulos de E/S. Transfieren datos entre el computador y su entorno externo (dispositivos externos que necesitan comunicarse/conectarse con la computadora).
* Bus del Sistema. Proporciona comunicación entre los procesadores, la memoria principal y los módulos de E/S.

## Intercambio de Datos entre el Procesador y la Memoria
Una de las funciones más importantes del procesador es el intercambio de datos con la memoria.  
Para llevar a cabo la transferecnia de datos entre estos dos dispositivos se hace uso de dos registros internos en el procesador. 

- Registro de Dirección de Memoria (RDIM). Especifica la dirección de memoria de la siguiente lectura o escritura.
- Registro de Datos de Memoria (RDAM). Contiene los datos que se van a escribir en la memoria o recibe los datos leídos de la memoria. 

- Registro de Dirección de E/S (RDIE/S). Especifica un determinado dispositivo de E/S.
- Registro de Datos de E/S (RDAE/S). Permite el intercambio de datos entre un módulo de E/S y el procesador. 

## ¿Qué es un Módulo de Mmemoria?
Consta de un conjunto de posiciones definidas mediante direcciones numeradas secuencialmente.
Cada posición contiene un patrón de bits que se puede interpretar como una instrucción, o como datos. 
Un módulo de E/S transfiere datos desde los dispositivos externos hacia el procesador y la memoria, y viceversa. Contiene buffers que mantienen temporalmente los datos hasta que se puedan enviar.
_________________________________________________________________________________________________________________________________________________________________________________________________________

# REGISTROS DEL PROCESADOR
Un procesador incluye un conjunto de registros que proporcionan un tipo de memoria que es más rápida y de menor capacidad que la memoria principal.
Los registros del procesador sirven para dos funciones:

- Registros visibles para el usuario. Permiten al programador en lenguaje máquina o ensamblador minimizar las referencias a la memoria principal, optimizando el uso de los registros. 
- Registros de control y estado. Son usados por el procesador para controlar su operación y por rutinas privilegiadas del sistema operativo para controlar la ejecución de programas.

## Registros Visibles por el Usuario
Los tipos de registros visibles por el usuario que están normalmente disponibles son los registros de datos, de dirección y códigos de condición.
A un registro visible por el usuario se puede acceder por medio del lenguaje máquina ejecutado por el procesador que está disponible generalmente para todos los programas, incluyendo a los programas de aplicac ión como los programas del sistema.

- Registros de datos. Se pueden usar por el programador para diversas funciones, mayormente son para propósitos generales y puede usarse con cualquier instrucción de lenguaje máquina que pueda realizar operaciones sobre los datos. Pero, muy frecuentemente hay restricciones para el programador sobre este tipo de datos.

- Los registros de dirección contienen direcciones de memoria principal de datos e intrucciones, o una parte de la dirección que se utiliza en el cálculo de la dirección efectiva o completa. Estos registros son de propósito general.

### Tipos de Registros de Dirección
* Registro Índice. Suma un índice a un valor base para obtener una dirección efectiva.
* Puntero de Segmento.
* Puntero de Pila.
Dependiendo del tipo de procesador, y tipo de máquina, los registros visibles por el usuario pueden ser guardados de forma automática, o deben ser guardados de forma manual por el programador.

## Registros de control y Estado
Se hace uso de varios registros del procesador para controlar el funcionamiento del mismo. En la mayoría de las máquinas, muchos de los tipos de registro no son visibles para el usuario.
A algunos de los registros que no son visibles para el usuario se les puede acceder por medio de instrucciones de máquinas ejecutadas en lo que se denomina modo de control o del sistema operativo.

### Tipos de Registros de Control y Estado
* Contador de Programa. Contiene la dirección de la próxima instrucción que se leerá en la memoria.
* Registro de Instrucción. Contiene la última instrucción leída.

Todos los diseños del procesador incluyen también un registro, o un conjunto de registros, conocido usualmente como la palabra de estado del programa. Contiene información de estado, un bit para habilitar/deshabilitar y un bit para habilitar el modo usuario/supervisor.

### Códigos de Condición/Indicadores
- Son bits cuyo valor lo asigna normalmente el hardware del procesador teniendo en cuenta el resultado de las operaciones. Los bits de control se agrupan en uno o más registros. Normalmente forman parte de un registro de control. 
- Una desición fundamental es el reparto de la información de control entre los registros y la memoria. Es habitual dedicar las primeras cientos o miles de palabras de memoria para propósitos de control. El diseñador debe decidir cuanta información de control debería estar en registros, más rápidos, más caros, y cuanta en memoria principal, menos rápida y más económica.
_______________________________________________________________________________________________________________________________________________________________________________________________________________

# EJECUCIÓN DE INSTRUCCIONES
Un programa que va a ejcutarse en un procesador consta de un conjunto de instrucciones almacenado en memoria.
El procesamiento de una instrucción consta de dos pasos: El procesador lee/busca instrucciones de la memoria, una por vez, y ejecuta cada una de ellas. 
La ejecución de un programa consiste en repetir el proceso de búsqueda y ejecución de instrucciones.
La ejecución de las instrucciones úede involucrar varias operaciones dependiendo de las naturaleza de la misma. 

- Se denomina ciclo de instrucción al proceso requerido por una única instrucción. El ciclo de instrucción en su forma más simple tiene su fase de búsqueda y la fase de ejecución.
- La ejecución de un programa se detiene sólo sai se apaga la máquina, se produce algún tipo de error irrecuperable o se ejecuta una instrucción del programa que para el procesador.

## Búsqueda y Ejecución de una instrucción
- A principio de cada ciclo de instrucción, el procesador lee una instrucción en la memoria.
En un procesador típico, el contador de programa almacena la dirección de la próxima instrucción que se va a ejecutar. 
El procesador siempre incrementa el contador de programa despues de cada instrucción ejecutada. De esta manera, las instrucciones se leerán y ejecutarán de manera secuencial.

La instrucción leída se carga dentro del registro de instrucción del procesador (IR es un tipo de registro de control y estado dentro del procesador, y no es visible para los usuarios).
La instrucción contiene bits que especifican la acción que debe realizar el procesador, luego, el procesador interpreta la instrucción y lleva a cabo la acción requerida. 

Acciones que lleva a cabo el procesador:
* Procesador-Memoria
* Procesador-E/S
* Procesamiento de Datos. El procesador puede realizar algunas operaciones aritméticas o lógicas sobre los datos.
* Control. Una instrucción puede especificar que se va a alterar la secuencia de ejecución. Por ejemplo, la instrucción actual puede indicar que la siguiente instrucción está n posiciones adelante, en lugar de realizar la ejecución en la siguiente instrucción. 
Siendo así, el procesador guardará el contador del programa en el valor de la insstrucción que se ha ejecutado. Entonces, la siguiente instrucción a ejecutar será acorde al valor que se ha almacenado en el contador del programa.

# SISTEMA DE E/S

# INTERRUPCIONES
* Programada
* Por temporizador
* De E/S
* Por fallo de Hardware
## Interrupciones y Ciclo de Instrucción
## Procesamiento de Interrupciones
## Múltiples Interrupciones
## Multiprogramación

# JERARQUÍA DE LA MEMORIA
# MEMORIA CACHÉ
# TÉCNICAS DE COMUNICACIÓN DE E/S
## E/S Programada
## E/S Dirigida por Interrupciones
## Acceso Directo a la Memoria (DMA)


















