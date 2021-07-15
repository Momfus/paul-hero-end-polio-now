///posicion_dato(cantidad_atributos, cantidad_digitos_por_atributo, cantidad_caracter_separador, numero_nivel, posición_bloque_cargar)  


//NOTA: La explicación larga y de los "por que" están al final.


var t = argument0, 
d = argument1, 
c = argument2, 
n = argument3, 
v = argument4; 

return ( t * d + c ) * ( n - 1 ) + v + ( v - 1 ) * d; 
/*

Aplique cosas aprendidas en matemática discreta en temas de recursión y algo de lo que vi en paradigmas para poder establecer 
la posición a cambiar de una cadena que guarda los distintos valores de los niveles que habrán en un juego y que se escriben 
en un fichero de texto. Por ejemplo: si hay 60 niveles niveles y uno quiere cambiar el tercer valor del 59, es poco optimo 
hacer que la computadora cuente de 0 hasta el 59 y de ahi sumarle los espacios hasta llegar a la posición requerida. Lo que 
hice guarda un valor "X" que representa la posición deseada, abre el archivo y directamente va a ahí para cambiarlo...sin 
hacer ciclo alguno.

Por si a alguno le ayuda la lógica (y aumentar aunque sea un poco mi ego para que dentro de unas horas caiga):

Cada "bloque de nivel" se compone de la siguiente forma:

A1 | A2 | A3 | A4 |

Donde cada "A" representa un atributo y siempre es seguido por un caracter " | " que sirve para diferenciar cuando termina y 
comienza otro valor.

Si tengo: (usando datos como ejemplo)

T = cantidad de atributos (en este caso, se toma en cuenta la cantidad de caracteres maximos a considerar)
D = cantidad de digitos que tiene cada atributo
C = cantidad de caracteres " | " (en este caso )
N = Número del nivel a cambiar
V = Posición del valor a cambiar en el bloque (que en este caso comienza en 1 y termina en 4, sin contar los caracteres 
" | " ).

LLego a una fórmula general sin necesidad de recursión (ahí es donde apliqué matemática discreta ya que usar recursión es 
poco óptimo):

( T * D + C ) * ( N - 1 ) + V + ( V - 1 ) * D


Con el siguiente bloque de ejemplos:

Nivel 1 = 1 | 2 | 1 | 1 | 
Nivel 2 = 2 | 1 | 0 | 1 |
Nivel 3 = 3 | 0 | 0 | 0 |

Se guardan en un fichero en la misma línea (mismas cadena, pero sin espacios, yo los pongo para que se distinga ahora):

1 | 2 | 1 | 1 | 2 | 1 | 0 | 1 | 3 | 0 | 0 | 0 |

Con la fórmula que hice (tengan en cuenta que el juego que estamos haciendo en Crios van a haber al menos 50 niveles, uso lo 
anterior como ejemplo) si quiere modificar el segundo valor ( A2 ) para que sea igual a 4 del tercer nivel (sabiendo que cada 
atributo es un solo digito):
(4 * 1 + 4) * ( 3 - 1 ) + 2 + ( 2 - 1) * 1 = 8 * 2 + 2 + 1 = 16 + 3 = [19]

Con la cadena que hice mas arriba, vayan contando posición a posición (empezando desde uno y cada vez que se mueven a la 
derecha un uno se suma, tomando en cuenta el caracter " | " ) 19 veces y verán que llegan a la segunda posición del tercer 
bloque ( que es el cero que le sigue al 3 )

*/
