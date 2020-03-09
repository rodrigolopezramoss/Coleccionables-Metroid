
CRUD METROID

Hecho con JSP, HTML, BOOTSTRAP y una base de datos. Dicha base de datos se encuentra también fuera del crud, para simplificar su búsqueda.

Este Crud tiene como objetivo ser una guía de coleccionables o expansiones de un juego: Metroid.
El Crud permite las altas, bajas y modificaciones de los coleccionables, así como de los distintos juegos de esta saga y de las distintas zonas que se dan en los mismos.

1.Iniciar Sesión

![alt text](https://github.com/rodrigolopezramoss/Coleccionables-Metroid/blob/master/capturas/ubuntu1804_v03-2020-03-09-17-33-32.png)

![alt text](https://github.com/rodrigolopezramoss/Coleccionables-Metroid/blob/master/capturas/ubuntu1804_v03-2020-03-09-17-33-54.png)


2.Primera Página: Juegos

![alt text](https://github.com/rodrigolopezramoss/Coleccionables-Metroid/blob/master/capturas/ubuntu1804_v03-2020-03-09-17-34-24.png)


Al iniciar sesión como usuario no tendremos acceso a "Añadir".

![alt text]()


3.Segunda Página: Zonas

![alt text]()


4.Tercera Página: Coleccionables

![alt text]()


5.Modificaciones y adiciones:
Al modificar, vamos a una página diferente para realizar dicha modificación.

![alt text](https://github.com/rodrigolopezramoss/Coleccionables-Metroid/blob/master/capturas/ubuntu1804_v03-2020-03-09-18-00-18.png)


Y esta es la página que se presenta al validar la modificación(Ocurre lo mismo al añadir):

![alt text](https://github.com/rodrigolopezramoss/Coleccionables-Metroid/blob/master/capturas/ubuntu1804_v03-2020-03-09-18-00-27.png)


6.El VÍDEO DESCRIPTIVO
En el que relato la transición dentro del Crud y expongo su código
Enlace: https://youtu.be/LeBDBuNEb68



Cabe mencionar que los usuarios no existen dentro de la base de datos, sino que se trata de sentencias condicionales(No tenía tiempo). Estos son los datos de los usuarios, que son dos:
admin - 4321

usu1 - 1221

Informe de errores(Que no he sabido solucionar):
1º Al modificar un juego, salta diciendo que no encuentra la columna "NomJue", que da el nombre del juego. Error que me extraña mucho, pues en el resto de páginas no da el mismo fallo teniendo igual código.

2º Al añadir un coleccionable, este se duplica. Error, estimo, de la propia base de datos.

