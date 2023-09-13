# Analizador Sintactico - Pila de Objetos

-- Elaborado por Dexne --

Código elaborado en lenguaje de programación C++

Analizador sintactico elaborado sin el uso de librerías ni expresiones regulaes
- El código sigue las reglas de fabricación y reducción del documento de actividades proporcionado por el profesor

  [Documento con las reglas](https://github.com/Dexne/Seminario_Traductores_2/blob/main/Analizador_Sintactico_Objetos/assets/Practica3Analizador_%20Sint%C3%A1ctico_%20LR.pdf)

A continuación, adjuntamos fotos de cuál fue la lógica que se utlizó para la resolución del programa:

[Lógica de producción y reducción](https://github.com/Dexne/Seminario_Traductores_2/blob/main/Analizador_Sintactico_Objetos/assets/logica.png)

Se realizaron 2 matrices de 5 x 4, una de ellas fue destinada para las reglas de producción y la otra para las reducciones:

[Reglas](https://github.com/Dexne/Seminario_Traductores_2/blob/main/Analizador_Sintactico_Objetos/assets/Reglas.png)

Para la generación de realizaron condicionales asociadas las reglas para saber si habia que hacer un push a identificadores o a estados númericos, además, apoyados de la matriz definidas, se realizabas las comprobaciones de cual elemento pila se debía de apilar y cuando terminar este proceso.

[Expansión](https://github.com/Dexne/Seminario_Traductores_2/blob/main/Analizador_Sintactico_Objetos/assets/expansion.png)

Lo mismo pero para las reducciones:

[Reducción](https://github.com/Dexne/Seminario_Traductores_2/blob/main/Analizador_Sintactico_Objetos/assets/expansion.png)


En esta pequeña implementación, al ser un script programado en C++ bajo el paradigma de dividir el código en modulos
se ha decido implementar un makefile para su compilación y ejecución.
Un makefile es un archivo que debe ser llamado especificamente "Makefile", el cual nos ayuda a estructurar y comprender
de mejor manera cual es proceso que siguen nuestros algoritmos al momento de ser ejecutados, además de que facilita mucho
el proceso de la ejecución del mimso

-- Pasos para la ejecución del códogo --

Descargar los archivos:
- EP.cpp
- includes.h
- main.cpp
- Makefile
- Pila.cpp

Debemos de asegurasrnos que tenemos todos y cada uno de ellos en una misma ruta.

Deberemos de dirigirnos a dicha ruta y ahí dentro abriremos una nueva terminal

A continuación deberemos de escribir la siguiente linea de comando: make (Debe de ser en letras minusculas y sin espacios)

Damos enter y el programa se compilará y ejecutará por si solo.

A continuación adjuntamos evidencias del funcionamiento del código.

Finalmente, adjunto una foto con el código en ejecución.
Cabe mencionar que la cadena ingresada es: a+b+c+d+e+f$.

[Ejecución del código](https://github.com/Dexne/Seminario_Traductores_2/blob/main/Analizador_Sintactico_Objetos/assets/ejecucion.png)

