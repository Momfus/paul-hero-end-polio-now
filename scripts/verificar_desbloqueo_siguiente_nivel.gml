///verificar_desbloqueo_siguiente_nivel(cadena:nombre_archivo, cadena:datos_sectores, entero:numero_nivel_actual)


/*

    Devuelve el valor que indica si el siguiente nivel del sector actual esta habilitado, si es el último nivel verifica del siguiente sector si este 
existe. En el caso que sea un nivel extra, se ignora.

*/

var nombre_archivo = argument0;

// Si el archivo existe se realiza la función, caso contrario se muestra un mensaje de error y se reinicia el juego (restaurando dicho archivo).
if( file_exists( nombre_archivo ) ){

    var numero_nivel = argument2;
    
    //Si no se está en un nivel extra (cuando es 11) se sigue normalmente, sino se devuelve cero (que no hay otro nivel).
    if( numero_nivel != 11 ){
    
        // Si no está en el último nivel, se verifica el siguiente normalmente...sino se controla si el primer nivel del siguiente sector está desbloqueado.    
        if( numero_nivel != 10 ){
        
            var cadena_datos_nivel = argument1,
                pos = 0,
                str_aux = "";
                
            //<< Se buca el dato del siguiente nivel>>
            pos = posicion_dato(4, 2, 4, ( sector_actual - 1) * 11 + ( numero_nivel + 1 ), 2 );
            
            while( string_char_at(cadena_datos_nivel, pos) != "|"  ){
            
                str_aux += string_char_at(cadena_datos_nivel, pos);
                pos++;
                
            }
            
            // << Se devuelve el valor en real >>
            return real(str_aux);
        
        }
        else{
        
            // Si no se está en el último sector (cuando es 6) se sigue normalmente, sino se devuelve cero (que no hay otro nivel ya que no hay siguiente sector).
            if( sector_actual != 6 ){
            
                var cadena_datos_nivel = argument1,
                    pos = 0,
                    str_aux = "";
            
                //<< Se buca el dato del primer nivel del siguiente sector>>
                pos = posicion_dato(4, 2, 4, sector_actual * 11 + 1, 2 );
                
                    while( string_char_at(cadena_datos_nivel, pos) != "|"  ){
                
                    str_aux += string_char_at(cadena_datos_nivel, pos);
                    pos++;
                    
                }
            
                // << Se devuelve el valor en real >>
                return real(str_aux);
                
            }
            else{ return 0; }
            
        }
        
    }
    else{ return 0; }

}
else{

    // Mensaje de error y reinicio de nivel
    show_message("Error - No se encuentra el archivo de guardado");   
    with(control_general){  
     
        prueba = true;
        event_perform(ev_keyrelease, ord("E") );
         
    }

}
