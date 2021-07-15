///verificar_desbloqueo_siguiente_sector(cadena:nombre_archivo, cadena:datos_sectores, entero:numero_sector_actual)

/*

    Devuelve el valor correspondiente del siguiente sector que indica si está desbloqueado.

*/

var nombre_archivo = argument0;

// Si el archivo existe se realiza la función, caso contrario se muestra un mensaje de error y se reinicia el juego (restaurando dicho archivo).
if( file_exists( nombre_archivo ) ){

    var numero_sector = argument2;

    // Si el siguiente sector no existe (hay solo 6 en el juego), se devuelve cero (false), caso contrario se verifica normalmente.
    if( ( numero_sector + 1 ) <= 6 ){
    
         var    cadena_datos_sector = argument1,
                pos = 0,
                str_aux = "";
    
    
        //<< Se busca el dato del siguiente sector. >>
        pos = posicion_dato(4, 2, 4, numero_sector + 1, 2);    
            
        while( string_char_at(cadena_datos_sector, pos) != "|"  ){
        
            str_aux += string_char_at(cadena_datos_sector, pos);
            pos++;
                
        }
        
        // << Se devuelve el valor en real >>
        return real(str_aux);
    
    }
    else{
    
        return 0;
    
    }

}
else{

    // Mensaje de error 
    show_message("Error - No se encuentra el archivo de guardado");   
     
}
