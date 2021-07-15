///verificar_para_desbloqueo(cadena:nombre_archivo, entero:numero_sector_actual, entero:numero_nivel_actual)

/*

    Esta función verifica si el siguiente nivel del sector y nivel que se indica del archivo recibido esta bloqueado o no, de estarlo lo desbloquea sino
continua normalmente. En el caso de estar en el último nivel del sector, se verifica si el siguiente sector esta bloqueado...en el caso de estarlo, lo
desbloquea y también el primer nivel del mismo; sino ignora y sigue.

    Al desbloquear algún nivel o sector, se modifica también el archivo con el nombre recibido.

*/

var nombre_archivo = argument0;

// Si el archivo existe se guardan los nuevos datos, caso contrario se muestra un mensaje de error y se reinicia el juego (restaurando dicho archivo).
if( file_exists( nombre_archivo ) ){

    var numero_nivel = argument2,
        pos = 0,
        str_aux = "",
        num_aux = 0,
        desbloqueado = 0, // Usado para saber si el dato obtenido indica que el nivel / sector esta desbloqueado o no.
        cadena_datos_sector = control_general.datos[0],
        cadena_datos_nivel = control_general.datos[1],
        mi_file;
            
    // Se verifica si se está en el último nivel (se debe desbloquear el siguiente sector en ese caso)
    if( numero_nivel != 10 ){
    
        var numero_sector = argument1;
            
            
        numero_nivel++; // Se suma uno para buscar el sigueinte nivel.
            
        // << Se obtiene el valor que indica si está desbloqueado (cero o uno) del siguiente nivel.>>    
        pos = posicion_dato(4, 2, 4, (numero_sector - 1) * 11 + numero_nivel, 2);
        
        while( string_char_at(cadena_datos_nivel, pos) != "|"  ){
    
            str_aux += string_char_at(cadena_datos_nivel, pos);
            pos++;
        
        }
        
        desbloqueado = real(str_aux);
        
        //<< se verifica si el nivel esta desbloqueado, en ese caso se desbloquea...caso contrario no se hace nada. >>     
        if( desbloqueado == false ){
        
            //<< Se suplanta el valor en la cadena de datos de nivel indicando que ahora está desbloqueado >>
            pos = posicion_dato(4, 2, 4, (numero_sector - 1) * 11 + numero_nivel, 2); 
            
            cadena_datos_nivel = string_delete( cadena_datos_nivel, pos, 2 );
            cadena_datos_nivel = string_insert( "01", cadena_datos_nivel, pos );   
    
            //<< Se obtiene el valor que indica la cantidad de niveles desbloqueados del sector que se está.
            str_aux = "";
            pos = posicion_dato(4, 2, 4, numero_sector, 3);        
            
            while( string_char_at(cadena_datos_sector, pos) != "|"  ){
    
                str_aux += string_char_at(cadena_datos_sector, pos);
                pos++;
            
            }
            
            num_aux = real(str_aux) + 1;
            
            //<< Se incrementa el número conseguido y se lo suplanta en el bloque de datos del sector correspondiente.
            str_aux = string_replace( string_format(num_aux, 2, 0), ' ', '0');

            pos = posicion_dato(4, 2, 4, numero_sector, 3); 
            
            cadena_datos_sector = string_delete( cadena_datos_sector, pos, 2 );
            cadena_datos_sector = string_insert( str_aux, cadena_datos_sector, pos ); 
            
            //<< Se sobreescriben las cadenas usadas para los datos del control_general. >>
            with(control_general){ 
            
                datos[0] = cadena_datos_sector; 
                datos[1] = cadena_datos_nivel; 
                
            }       
                    
            /* Se abre el archivo correspondiente y se guarda la nuevas cadenas.*/
            mi_file = file_text_open_write(nombre_archivo);
    
                file_text_write_string(mi_file, cadena_datos_sector);
                file_text_writeln(mi_file);
                file_text_write_string(mi_file, cadena_datos_nivel);
        
            file_text_close( mi_file );        
        
        }       
              
    }
    else{
    
        // << Se verifica si hay que desbloquear el siguiente sector. >>
        var numero_sector = argument1 + 1, // Se suma uno ya que desbloquea el siguiente sector. 
            numero_nivel = 1; // Tiene el valor "1" ya que se desbloquea el primer nivel del siguiente sector.
        
        // << Se obtiene el valor que indica si está desbloqueado (cero o uno) del siguiente nivel.>>    
        pos = posicion_dato(4, 2, 4, numero_sector, 2);
        
        while( string_char_at(cadena_datos_sector, pos) != "|"  ){
    
            str_aux += string_char_at(cadena_datos_sector, pos);
            pos++;
        
        }
        
        desbloqueado = real(str_aux);
        
        //<< Se verifica si el sector esta desbloqueado, en ese caso se desbloquea...caso contrario no se hace nada. >>   
        if( desbloqueado == false ){
    
            //<< Se suplanta el valor en la cadena de datos de sector indicando que ahora está desbloqueado >>
            pos = posicion_dato(4, 2, 4, numero_sector, 2);
            
            cadena_datos_sector = string_delete( cadena_datos_sector, pos, 2 );
            cadena_datos_sector = string_insert( "01", cadena_datos_sector, pos );   
    
            //<< Se suplanta el valor en la cadena de datos del primer nivel del siguiente sector indicando que ahora está desbloqueado >>
            pos = posicion_dato(4, 2, 4, (numero_sector - 1) * 11 + numero_nivel, 2);
            cadena_datos_nivel = string_delete( cadena_datos_nivel, pos, 2 );
            cadena_datos_nivel = string_insert( "01", cadena_datos_nivel, pos );  
 
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
    

}
else{

    // Mensaje de error y reinicio de nivel
    show_message("Error - No se encuentra el archivo de guardado");   
    with(control_general){  
     
        prueba = true;
        event_perform(ev_keyrelease, ord("E") );
         
    }
     
}
