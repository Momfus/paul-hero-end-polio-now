///cargar_total_ruedas_nivel(cadena:datos_niveles, entero:numero_sector, entero:numero_nivel)

/*

    Se carga la cantidad de ruedas obtenidas en el nivel que se está.

*/
var cadena_datos, str_aux, pos, total_ruedas;

cadena_datos = argument0;
total_ruedas = 0;


pos = posicion_dato(4, 2, 4, ( argument1 - 1 ) * 11 + argument2, 3); // Ubicación del puntero, se ubca en el decimal más a la izquierda del valor a buscar.
str_aux = ""; // Cadena temporal donde se guardan los valores que luego se convierten en reales.

// Se guarda el conjunto de datos entre los signos "|"
while( string_char_at(cadena_datos, pos) != "|" ){

      str_aux += string_char_at(cadena_datos, pos);
      pos++;

}

total_ruedas += real(str_aux); // Se suma al total acumulado.

return total_ruedas; // Retorno del total de ruedas rotarias obtenidas en el nivel
