Creación de un analizador sintacto con ayuda de Yacc/Bison y flex

Esta versión del código es capaz de funcionar a la perfección
Para que el código funcione de la manera más optima, la cadena de entrada debe de estar separada por espacios, ejemplo:
if ( 3 > 7 ) # Esto  es una cadena valida que podria reconocer

El código esta hecho en lenguaje C con ayuda de las herramientas Yacc/Bison y Flex, tecnologías que fueron desarrolladas y
son usadas especificamente para la elabioración de analizadores sintacticos y ayudar con el desarrollo de parsers.

Para el correcto funcionamiento de programa debemos de hacer lo siguiente:

1. Descargar los archivos con extensión .y, .l y Makefile
2. Seguido de eso debemos de abrir una terminal en la ruta donde tenemos nuestros archivos
3. El programa hace uso de un Makefile para llevar a cabo los procesos de compilado y ejecución de todo el programa.
4. Escribimos en nuestra terminal "make"
5. El programa se compilará
6. Seguido de eso debemos de escribir "./parser", también podemos escribir ./ y darle al tabulador para autocompletar.
7. Una vez hecho eso nuestro programa se ejecutará sin problemas

-[Makefile](https://github.com/Dexne/Seminario_Traductores_2/blob/main/Analizador_sintatico_codigo/assets/make.png)

Mostramos las asociaciones de clave-valor para los tokens

-[tokens](https://github.com/Dexne/Seminario_Traductores_2/blob/main/Analizador_sintatico_codigo/assets/tokes.png)

-[rules](https://github.com/Dexne/Seminario_Traductores_2/blob/main/Analizador_sintatico_codigo/assets/rules.png)

Adjunto capturas del funcionamiento

-[ejecucion](https://github.com/Dexne/Seminario_Traductores_2/blob/main/Analizador_sintatico_codigo/assets/ejecucion.png)
