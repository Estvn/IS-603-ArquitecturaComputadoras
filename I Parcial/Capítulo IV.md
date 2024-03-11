# INSTRUCCIONES DE TRANSFERENCIA DE DATOS
- Este capítulo se centra en las instrucciones de transferencia de datos. Estas instrucciones permiten transferir información entre la memoria y los registros del procesador, y viceversa. distinguiendose, según el destino de transferencia entre **instrucciones de carga**, las que transfieren información a los registros, e **intrucciones de almacenamiento**, las que transfieren información a la memoria.
- Las instrucciones de transferencia de datos son las únicas que pueden acceder a la memoria. Esto implica que para poder realizar operaciones con datos almacenados en la memoria, primero será necesario cargarlos en registros, y una vez realizadas las operaciones pueden ser almacenados sus resultados en memoria. Esta decisión permite que la arquitectura disponga de un juego de instrucciones más simple.

# INSTRUCCIONES DE CARGA
Las instrucciones de carga son las que transfieren información a los registros. Esta información puede estar en la propia instrucción o en memoria.

## Carga de Datos Constantes
<<mov rd, #Inm8>>


