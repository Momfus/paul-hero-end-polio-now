///cargar_total_ruedas_sector(cadena_datos_sectores, numero_de_sector)

/*

    Se carga la cantidad de ruedas obtenidas en el sector que se está sumando los obtenidos en cada nivel de dicho sector y luego se devuelve ese número.

*/

var cadena_datos, str_aux, nivel_inicial_sector, total_ruedas, pos;

cadena_datos = argument0;
nivel_inicial_sector = ( argument1 - 1 ) * 11 + 1;
total_ruedas = 0;

pos = 1; // Ubicación del puntero, con el valor "1" señala el primer caracter de la cadena.
str_aux = ""; // Cadena temporal donde se guardan los valores que luego se convierten en reales para sumar.

// Se recorre desde el primer nivele nivel del sector que se está hasta el nivel 11 niveles, sumando las ruedas obtenidas en cada uno y sumandolo al total.
for( var i = nivel_inicial_sector; i <= ( nivel_inicial_sector + 10 ); i++ ){

    pos = posicion_dato( 4, 2, 4, i, 3 ); // Se ubica el puntero.
    
    // Se guarda el conjunto de datos entre los signos "|"
    while( string_char_at(cadena_datos, pos) != "|" ){
    
        str_aux += string_char_at(cadena_datos, pos);
        pos++
    
    }
    
    total_ruedas += real(str_aux); // Se suma al total acumulado.
    
    str_aux = ""; // Se reinicia la cadena auxiliar para recibir luego otra.

}

return total_ruedas; // Retorno del total de ruedas rotarias recogidas en todo el juego.
