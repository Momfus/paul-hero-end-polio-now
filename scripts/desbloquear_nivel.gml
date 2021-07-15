#define desbloquear_nivel
///desbloquear_nivel(cadena: nombre_archivo, entero: sector, entero: nivel )

/*

    Esta función desbloquea el nivel indicado del sector recibido.

*/

var nombre_archivo = argument0;

// Si el archivo existe se realiza la función, caso contrario se muestra un mensaje de error y se reinicia el juego (restaurando dicho archivo).
if( file_exists( nombre_archivo ) ){

    // Se desbloquea el nivel deseado.
    var numero_sector = argument1,
        numero_nivel = argument2,
        cadena_datos_sector = control_general.datos[0],
        cadena_datos_nivel = control_general.datos[1],
        pos = 0,
        str_aux = "",
        bloqueado = false,
        mi_file = 0;
    
        //<< Se buca el dato del nivel>>
        pos = posicion_dato(4, 2, 4, ( numero_sector - 1) * 11 + numero_nivel, 2 );
            
        while( string_char_at(cadena_datos_nivel, pos) != "|"  ){
            
            str_aux += string_char_at(cadena_datos_nivel, pos);
            pos++;
                
        }
        
        //<< Corrobora si el nivel esta bloqueado, si es asi lo desbloquea...sino no hace nada.
        bloqueado = real( str_aux );
    
        if( bloqueado == false ){

            //<< Se suplanta el valor en la cadena de datos de nivel indicando que ahora está desbloqueado >>
            pos = posicion_dato(4, 2, 4, (numero_sector - 1) * 11 + numero_nivel, 2); 
            
            cadena_datos_nivel = string_delete( cadena_datos_nivel, pos, 2 );
            cadena_datos_nivel = string_insert( "01", cadena_datos_nivel, pos );   
    
            // Solo se aumente la cantidades del nivel del sector en el caso que no sea el primero
            if( numero_nivel != 1 ){
            
                //<< Se obtiene el valor que indica la cantidad de niveles desbloqueados del sector que se está.
                str_aux = "";
                pos = posicion_dato(4, 2, 4, numero_sector, 3);        
                
                while( string_char_at(cadena_datos_sector, pos) != "|"  ){
        
                    str_aux += string_char_at(cadena_datos_sector, pos);
                    pos++;
                
                }
                
                //<< Se incrementa el número conseguido y se lo suplanta en el bloque de datos del sector correspondiente.
                num_aux = real(str_aux) + 1;
            
                str_aux = string_replace( string_format(num_aux, 2, 0), ' ', '0');
    
                pos = posicion_dato(4, 2, 4, numero_sector, 3); 
                
                cadena_datos_sector = string_delete( cadena_datos_sector, pos, 2 );
                cadena_datos_sector = string_insert( str_aux, cadena_datos_sector, pos ); 
                    
            }
            
            //<< Se sobreescriben las cadenas usadas para los datos del control_general. >>
            with(control_general){ 
            
                datos[0] = cadena_datos_sector; 
                datos[1] = cadena_datos_nivel; 
                
            }  
                    
            // < Se abre el archivo correspondiente y se guarda la nuevas cadenas.>>
            mi_file = file_text_open_write(nombre_archivo);
    
                file_text_write_string(mi_file, cadena_datos_sector);
                file_text_writeln(mi_file);
                file_text_write_string(mi_file, cadena_datos_nivel);
        
            file_text_close( mi_file );
            
        }

}
else{

    // Mensaje de error y reinicio de nivel
    show_message("Error - No se encuentra el archivo de guardado");   
    with(control_general){  
     
        prueba = true;
        event_perform(ev_keyrelease, ord("E") );
         
    }

}

#define desbloquear_sector
///desbloquear_sector(cadena: nombre_archivo, entero: sector )

/*

    Esta función desbloquea el sector indicado del sector recibido.

*/

var nombre_archivo = argument0;

// Si el archivo existe se realiza la función, caso contrario se muestra un mensaje de error y se reinicia el juego (restaurando dicho archivo).
if( file_exists( nombre_archivo ) ){

    // Se desbloquea el nivel deseado.
    var numero_sector = argument1,
        cadena_datos_sector = control_general.datos[0],
        pos = 0,
        str_aux = "",
        bloqueado = false,
        mi_file = 0;
    
        //<< Se buca el dato del sector>>
        pos = posicion_dato(4, 2, 4, numero_sector, 2 );
            
        while( string_char_at(cadena_datos_sector, pos) != "|"  ){
            
            str_aux += string_char_at(cadena_datos_sector, pos);
            pos++;
                
        }
        
        //<< Corrobora si el nivel esta bloqueado, si es asi lo desbloquea...sino no hace nada.
        bloqueado = real( str_aux );
        
        if( bloqueado == false ){
        
            //<< Se suplanta el valor en la cadena de datos de sector indicando que ahora está desbloqueado >>
            pos = posicion_dato(4, 2, 4, 6, 2); 
            
            cadena_datos_sector = string_delete( cadena_datos_sector, pos, 2 );
            cadena_datos_sector = string_insert( "01", cadena_datos_sector, pos );   
                
            //<< Se sobreescriben las cadenas usadas para los datos del control_general. >>
            with(control_general){ datos[0] = cadena_datos_sector; }  
                    
            // < Se abre el archivo correspondiente y se guarda la nuevas cadenas.>>
            mi_file = file_text_open_write(nombre_archivo);
    
                file_text_write_string(mi_file, cadena_datos_sector);
                file_text_writeln(mi_file);
                file_text_write_string(mi_file, control_general.datos[1] );
        
            file_text_close( mi_file );
            
        }

}
else{

    // Mensaje de error y reinicio de nivel
    show_message("Error - No se encuentra el archivo de guardado");   
    with(control_general){  
     
        prueba = true;
        event_perform(ev_keyrelease, ord("E") );
         
    }

}