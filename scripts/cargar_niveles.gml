///cargar_niveles(cadena:datos_niveles, entero:num_sector)

/* <<< Se cargan los datos de los niveles en la cadena recibida teniendo en cuenta de que sector se busca, luego se colocan los paquetes de valores en los
niveles correspondientes >>> */


var str, num_sector, pos, str_aux, valor, num, cantidad_niveles;
/*
str                 = La cadena recibida
num_sector          = Indica el bloque de 11 niveles del sector que quiere obtenerse.
pos                 = Puntero para señalar el caracter a controlar.
str_aux             = Cadena auxiliar que guarda el bloque de datos deseados por cada nivel
valor               = Arrelo que guarda en cada posición los datos de la cadena convertidos en números sin el signo '|'
                                    
                    [0] = Número del nivel( con el que se verifica a cual añadir el conjunto de datos almacenados).
                    [1] = Indica si el nivel está desbloqueado.
                    [2] = Indica la cantidad de rueda rotarias obtenidas en el nivel.
                    [3] = Indica la cantidad de orbes obtenidas en el nivel.
                    
num                 = Puntero que marca la posición a guardar en el arrelo "valor".
cantidad_niveles    = Usado para comparar con la cantidad de niveles que hay en el sector y saber cuando detenerse.

*/

str = argument0;
num_sector = argument1;
pos = 1;
str_aux = "";
num = 0;
cantidad_niveles = 0;

// Se situa el inicio del puntero en el conjunto de sectores correspondiente.
pos = posicion_dato(4, 2, 4, ( num_sector - 1 ) * 11 + 1, 1);

// Se controla que la cantidad de niveles cargados sea menor a 11 (cantidad por sector)
while( cantidad_niveles < 11 ){

    // Mientras el caracter que se apunta no sea el separador '|', se va almacenando en str_aux.
    while( string_char_at(str, pos) != "|"  ){
    
        str_aux += string_char_at(str, pos);
        pos++;
    
    }
    
    /* Se guarda el dato en el vector "valor" en la posición "num" (este último se aumenta para que señale la siguiente posicion a guardar). Se reinician los 
    atributos necesarios. */
    valor[num] = real( str_aux );
    num++;
    
    str_aux = "";
    pos++;

    /* Al juntar la cantidad de datos necesario por bloque(cuatro), se verifica con cada "bloque de nivel" si tiene como numero el mismo valor almacenado en 
    valor[0], si es asi, se colocan los valores almacenados en el resto del arreglo. */
    if( num == 4 ){
    
        num = 0;
        cantidad_niveles++; // Se señala que se cargó un nivel mas del sector.
        
        with( ob_bloque_nivel ){
        
            if( valor[0] == numero_juego ){
            
                desbloqueado = valor[1];
                ruedas_obtenidas = valor[2];
                orbes_obtenidas = valor[3];
                
            }
        
        }
    
    }
    
}
