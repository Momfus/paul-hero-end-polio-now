///cargar_sectores(cadena:datos_sectores)

//<<< Se cargan los datos almacenados en la cadena recibida (cada valor se separa por '|') y se colocan en cada bloque de sector. >>>

var str, pos, str_aux, valor, num;
/*
str         = La cadena recibida
pos         = Puntero para señalar el caracter a controlar.
str_aux     = Cadena auxiliar que guarda el bloque de datos deseados por cada sector.
valor       = Arrelo que guarda en cada posición los datos de la cadena convertidos en números sin el signo '|'
                                    
                    [0] = Número del sector( con el que se verifica a cual añadir el conjunto de datos almacenados).
                    [1] = Indica si el sector esta desbloqueado.
                    [2] = Indica la cantidad de niveles desbloqueados que tiene.
                    [3] = Indica la cantidad de ruedas rotarias obtenidas en el sector.
                    
num         = Puntero que marca la posición a guardar en el arrelo "valor".
*/

str = argument0;
pos = 1;
str_aux = "";
num = 0;
valor = 0;

// Se controla que la posición en que se esta buscando no supere a la cadena recibida.
while( pos < string_length(str) ){

    // Mientras el caracter que se apunta no sea el separador '|', se va almacenando en str_aux.
    while( string_char_at(str, pos) != "|" ){
    
        str_aux += string_char_at(str, pos);
        pos++;
    
    }
    
    /* Se guarda el dato en el vector "valor" en la posición "num" (este último se aumenta para que señale la siguiente posicion a guardar). Se reinician los 
    atributos necesarios. */
    valor[num] = real(str_aux);
    num++;
    
    str_aux = "";
    pos++;
    
    /* Al juntar la cantidad de datos necesario por bloque(cuatro), se verifica con cada "bloque de sector" si tiene como numero el mismo valor almacenado en 
    valor[0], se es asi, se colocan los valores almacenados en el resto del arreglo. */
    if( num == 4 ){
    
        num = 0;
    
        with(ob_bloque_sector){
        
            if( valor[0] == numero ){
            
                desbloqueado = valor[1];
                niveles_desbloqueados = valor[2];
                ruedas_obtenidas = valor[3];
                
            }
        
        }
    
    }
    
} 
