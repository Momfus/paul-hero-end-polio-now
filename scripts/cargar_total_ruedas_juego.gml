///cargar_total_ruedas_juego(cadena_datos_sectores)

/*

    Se carga el total de las ruedas rotarias obtenidas sumando la cantidad de ruedas rotarias conseguidas por sector y luego se devuelve ese número.

*/

var cadena_datos, total_ruedas, pos, str_aux;

cadena_datos = argument0;
total_ruedas = 0;

pos = 1; // Ubicación del puntero, con el valor "1" señala el primer caracter de la cadena.
str_aux = ""; // Cadena temporal donde se guardan los valores que luego se convierten en reales para sumar.

// Se va recorriendo la cadena buscando los valores ubicados en la posicion de cantidad de ruedas rotarias y se suma al total 
for( var i = 0; i < 6; i++ ){

    pos = posicion_dato( 4, 2, 4, i + 1, 4 ); // Se ubica el puntero.
    
    // Se guarda el conjunto de datos entre los signos "|"
    while( string_char_at(cadena_datos, pos) != "|" ){
    
        str_aux += string_char_at(cadena_datos, pos);
        pos++
    
    }
    
    total_ruedas += real(str_aux); // Se suma al total acumulado.
    
    str_aux = ""; // Se reinicia la cadena auxiliar para recibir luego otra.

}

return total_ruedas; // Retorno del total de ruedas rotarias recogidas en todo el juego.
