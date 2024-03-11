@author estiven.mejia@unah.hn 
@version 0.1.2
@date 2024/02/16
@description "EJERCICIOS DE LA TAREA I | IS603 - ARQUITECTURA DE COMPUTADORAS | 1600"
______________________________________________________________________________________________________________________________________________________________________________________________________

# EJERCICIO 2.12
El siguiente programa carga en los registros r0 al r3 los caracteres ‘H’, ‘o’, ‘l’ y ‘a’, respectivamente. Copia dicho programa en QtARMSim, cambia al modo de simulación y contesta las siguientes preguntas.

* **2.12.1 Cuando el simulador ha desensamblado el código máquina, ¿qué ha pasado con las letras «H», «o», «l» y «a»? ¿A qué crees que es debido?**
- En la parte de desensamblado, los caracteres que se agregaron a los registros se muestran con su equivalente a ASCII.

* **2.12.2 Ejecuta paso a paso el programa, ¿qué números se van almacenando en los registros r0 al r3?**
- 0x48, 0x6F, 0x6C y 0x61. En decimal son: 72, 111, 108 y 97.
______________________________________________________________________________________________________________________________________________________________________________________________________

# EJERCICIO 2.18
Desarrolla un programa ensamblador que realice la siguiente reserva de espacio en memoria: una palabra, un byte y otra palabra alineada en una dirección múltiplo de 4.

- Observaciones: Se almacenó la primera palabra a partir del registro <<r0>>, se almacena el byte en <<r4>>, luego se alinea la memoria en una direccion múltiplo de 4 <<r8>> y finalmente se almacena la última palabra en la siguiente dirección múltiplo de 4 <<r8>>. 
______________________________________________________________________________________________________________________________________________________________________________________________________

# EJERCICIO 2.19
Desarrolla un programa ensamblador que realice la siguiente reserva de espacio e inicialización de memoria: una palabra con el valor 3, un byte con el valor 0x10, una reserva de 4 bytes que comience en una dirección múltiplo de 4, y un byte con el valor 20.

- Observaciones: El enunciado pide realizar una reserva de bytes a partir de una dirección múltiplo de 4. Se debe realizar un alineamiento antes de la reserva de espacio, para que se cumpla la petición en el enunciado.
______________________________________________________________________________________________________________________________________________________________________________________________________

# EJERCICIO 2.20
Modifica el siguiente código sustituyendo la primera directiva «.word» por una directiv «.byte» y la segunda directiva «.word» por una directiva «.hword», y modificando los valores numéricos dados para que al ensamblar el nuevo código se realice la misma inicialización de memoria que la realizada por el código original.

- Observaciones: Según los reemplazos solicitados, y manteniendo la misma inicialización de memoria que el código original, se hará una división del primer dato en 4 directivas <<.byte>>, y una división del segundo dato en 2 directivas <<.hword>>, esto con el propósito de mantener la memoria en el mismo estado de inicialización que se ha mostrado en el código original.
______________________________________________________________________________________________________________________________________________________________________________________________________

# EJERCICIO 2.24
Desarrolla un programa ensamblador que inicialice, en el espacio de datos, la cadena de caracteres «Esto es un problema», utilizando:
a) La directiva «.ascii»
b) La directiva «.byte»
c) La directiva «.word»
(Pista: Comienza utilizando solo la directiva «.ascii» y visualiza cómo se almacena en memoria la cadena para obtener la secuencia de bytes.)

- **Observaciones:**
- En este ejercicio se ha demostrado que la inicialización de datos en la parte del código <<.data>> lleva a almacenar los datos en la memoria RAM (0x2007 0000).
- Cada caracter escrito en la cadena de ascii pesa 1 byte.
- La organización de los datos, tanto en RAM como en ROM usa el ordenamiento "Little Endian".
______________________________________________________________________________________________________________________________________________________________________________________________________

# EJERCICIO 3.15
Se quiere guardar en el registro r1 el resultado de sumar 100 a una variable. El siguiente código, que no puede compilarse, inicializa el registro r0 a 250 para después sumar el valor constante 100 al contenido de r0. Comprueba qué problema presenta el siguiente código y corrígelo para que en r1 se almacene la suma de un valor variable y el dato inmediato 100.

- Solución al problema: El fallo en el código es que la instrucción <<add>> no permite una suma que su resultado sobrepase el valor de 255 cuando se definen 3 variables en la línea de código. Dos posibles soluciones para este fallo sería agregar el valor literal "100" en un registro y sumarlo con el contenido de r0, logrando así una suma con dos variables definidas en la instrucción <<add>>. La solución más simple es hacer la suma del contenido de <<r0>> con el valor literal 100, así mateniendo la declaración de 2 variables en la línea de código.
______________________________________________________________________________________________________________________________________________________________________________________________________

# EJERCICIO 3.16
El siguiente programa aplica una máscara de 32 bits sobre el contenido de r0 para poner todos sus bits a 0 salvo los bits 8, 9, 10 y 11, que mantienen su valor original. Cópialo en el simulador y realiza los siguientes ejercicios.

* **3.16.1 ¿Qué (seudo-)instrucciones se han utilizado en el código fuente en ensamblador para cargar sendos valores de 32 bits en los registros r0 y r1?**

* **3.16.2 Ejecuta el programa. ¿Qué valor, expresado en hexadecimal, se almacena en el registro r0? ¿Coincide con lo descrito al principio de este ejercicio?**

* **3.16.3 Modifica el código anterior para que en lugar de aplicar una máscara que mantenga los bits 8, 9, 10 y 11 del contenido del registro r0 y ponga a 0 el resto, mantenga los mismos bits, pero ponga a 1 los restantes. ¿Qué mascara de bits has cargado en el registro r1? ¿Qué operación lógica has realizado?**

* **3.16.4 Modifica el código original para que en lugar de aplicar una máscara que mantenga los bits 8, 9, 10 y 11 del contenido del registro r0 y ponga a 0 el resto, mantenga los mismos bits, pero invierta los bits restantes. ¿Qué mascara de bits has cargado en el registro r1? ¿Qué operación lógica has realizado?**

☠️☠️☠️
______________________________________________________________________________________________________________________________________________________________________________________________________

# EJERCICIO 3.17
Copia el siguiente programa en el simulador, ejecútalo y realiza los ejercicios propuestos.

* **3.17.1 ¿Qué valor acaba teniendo el registro r0? ¿Se ha conservado el signo del número cargado inicialmente en r0?**
- El valor que acaba teniendo es el <<FFFF FFF4 == -12>>, y si se conserva el signo. Esto es debido a que la última instrucción escrita realiza un desplazamiento aritmético a la izquierda, este desplazamiento movió el número hexadecimal 4 bits a la izquierda, y respeta el signo del bit más significativo.

* **3.17.2 Modifica el programa para comprobar su funcionamiento cuando el número que se desplaza es positivo.**
- El número cambia de signo.

* **3.17.3 Modifica el programa propuesto originalmente para que realice un desplazamiento de 3 bits, en lugar de 4. Como se puede observar, la palabra original era 0xFFFF FF41 y al desplazarla se ha obtenido la palabra 0xFFFF FFE8. Representa ambas palabras en binario y comprueba si la palabra obtenida corresponde realmente al resultado de desplazar 0xFFFF FF41 3 bits a la derecha conservando su signo.**
0xFFFF FF41 ==1111 1111 0100 0001 
0xFFFF FFE8 ==1111 1111 1110 1000
- Al hacer un desplazamiento el resultado correcto es: 0xFA08 == 1111 1010 0000 1000

* **3.17.4 Como se ha visto, la instrucción «lsr», desplazamiento lógico a derechas (logical shift right), también desplaza a la derecha un determinado número de bits el valor indicado. Sin embargo, no tiene en cuenta el signo y rellena siempre con ceros. Modifica el programa original para que utilice la instrucción «lsr» en lugar de la «asr» ¿Qué valor se obtiene ahora en r0?**

0x1FFFFFFE8 == 536870888

* **3.17.5 Modifica el código anterior para desplazar el contenido de r0 2 bits a la izquierda. ¿Qué valor acaba teniendo ahora el registro r0 tras ejecutar el programa?**
- Aplicando el desplazamiento lógico a la izquiera se obtiene: 0XFFFFFA08 == -1528

* **3.17.6 Siempre que no se produzca un desbordamiento, desplazar n bits a la izquierda equivale a una determinada operación aritmética. ¿A qué operación aritmética equivale? ¿A qué equivale desplazar 1 bit a la izquierda? ¿Y desplazar 2 bits? ¿Y n bits?**
- Cuando se desplazan bits a la izquierda, se están agregando bits en la derecha. Cuando se está desplazando bits a la izquierda, en términos de operaciones aritméticas, se está realizando una multiplicación de 2^n al número codificado en bits.
______________________________________________________________________________________________________________________________________________________________________________________________________

# EJERCICIO 3.19
Desarrolla un programa que multiplique por 32 el número almacenado en el registro r0 sin utilizar operaciones aritméticas (es decir, no puedes utilizar la instrucción de multiplicación, ni la de suma). Para probar el programa, inicializa el registro r0 con la palabra 0x0000 0001.

- Solución: Se pide realizar una multiplicación sin utilizar instrucciones aritméticas. Una solución es hacer uso de las instrucciones de desplazamiento, al realizar desplazamientos a la izquierda se está haciendo una múltiplicación al dato del registro en 2^n. Si se hace un desplazamiento a la derecha, se hace una división a 2 al dato en cuestión. 
______________________________________________________________________________________________________________________________________________________________________________________________________

# EJERCICIO 3.20
Desarrolla un programa que modifique el valor de la palabra almacenada en el registro r0 de tal forma que los bits 11, 7 y 3 se pongan a cero mientras que los bits restantes conserven el valor original. Para probar el programa, inicializa el registro r0 con 0x00FF F0F0.

- Solución: Para mantener los datos indicados en 0, y los demás datos mantengan su signo se ha usado la instrucción <<.eor>>. Para que los bits indicados se pongan en 0 se ha hecho la comparación son su mismo valor, ya que con O exclusivo, estrictamente, cuando solo un valor es 1, el resultado será 1. Para los demás datos se ha procurado encontrar el otro valor que diera como resultado de la comparación el valor original.



