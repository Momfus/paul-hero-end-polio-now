///verificar_desbloqueo(cadena:nombre_archivo, cadena:datos_nivel, entero:numero_sector, entero:numero_nivel)

/*

    Este código verifica si el nivel del sector indicado esta desbloqueado (devuelve true) o no (devuelve false).

*/

var nombre_archivo = argument0;

// Si el archivo existe se realiza la función, caso contrario se muestra un mensaje de error y se reinicia el juego (restaurando dicho archivo).
if( file_exists( nombre_archivo ) ){

    var cadena_datos_nivel = argument1,
        numero_sector = argument2,
        numero_nivel = argument3,
        pos = 0,
        str_aux = "";
    
    // << Se busca el dato del nivel deseado >>
    pos = posicion_dato(4, 2, 4, ( numero_sector - 1) * 11 + numero_nivel, 2 );
            
    while( string_char_at(cadena_datos_nivel, pos) != "|"  ){
            
        str_aux += string_char_at(cadena_datos_nivel, pos);
        pos++;
                
    }
        
    // << Se devuelve el valor en real >>
    return real(str_aux);

}
else{

    // Mensaje de error y reinicio de nivel
    show_message("Error - No se encuentra el archivo de guardado");   
    with(control_general){  
     
        prueba = true;
        event_perform(ev_keyrelease, ord("E") );
         
    }

}
