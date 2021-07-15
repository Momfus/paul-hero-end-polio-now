///crear_save(cadena:nombre_del_archivo);

// NOTA: Para un mejor control al cargar y modificar los datos, se establece que todo debe ser almacenado en formato de dos digitos (en vez de "0" es "00")

/*  file = guarda el ID del archivo creado o leído
    str = cadena auxiliar que almacena la información a guardar en el archivo o la información a cargar si ya existe dicho archivo.
    i = contador auxiliar para los "for".
    local_nombre_archivo = nombre del archivo a crear o cargar */
var file, str, i, local_nombre_archivo = argument0; 

// Si el archivo del argumento recibido no existe, se crea y se colocan los valores por defecto.
if( !file_exists(local_nombre_archivo) ){

    /*  cantidad_sectores = cantidad de sectores que hay en el juego
        cantidad_niveles_sectores = 10 comunes + 1 especial
        cantidad_niveles_totales = la multiplicacion de los anteriores dos*/
    var cantidad_sectores = 6, cantidad_niveles_sector = 11, cantidad_niveles_totales; 

    cantidad_niveles_totales = cantidad_sectores * cantidad_niveles_sector;
    
    // Se cre el archivo.
    file = file_text_open_write( local_nombre_archivo ); 
    
    // Se introduce el contenido.
    
        //<< Datos base de cada sector >>
        
            // Se setean algunos valores iniciales
            str = "";
            i = 0;
        
            //---> numero | desbloqueado ( 00 = false; 01 = true ) | niveles_desbloqueados | ruedas_obtenidas
               
                str += '0' + string( i+1 ) + "|01|01|00|"; /* El primer sector debe estar desbloqueado...pero todos cuentan con al menos un nivel disponible (el 
                                                            primero) desbloqueado.*/
                
                // Se guarda el estado base de los demas sectores (considerando si es de menos dos digitos el número del sector)
                for( i = 1; i < cantidad_sectores; i++ ){ 
                
                    if( i < 9){ str += '0' + string( i+1 ) + "|00|01|00|"; }
                    else{ str += string( i+1 ) + "|00|01|00|"; }
                    
                } 
                
                // Se guarda el contenido el archivo y se hace un salto de línea.
                file_text_write_string(file, str);
                file_text_writeln(file);
                
        //<< Datos base de cada nivel>>
        
            // Se setean algunos valores iniciales
            str = "";
            i = 0;

            //---> numero | desbloqueado ( 00 = false; 01 = true ) | ruedas obtenidas | orbes_obtenidas
            
                str += '0' + string( i+1 ) + "|01|00|00|" // El primer nivel debe estar desbloqueado.
                
                // Se guarda el estado base de los demas niveles (se considera si el número del nivel es menor a dos digitos)
                for( i = 1; i < cantidad_niveles_totales; i++ ){ 
                
                    if( i < 9 ){ str += '0' + string( i+1 ) + "|00|00|00|"; }
                    else{ str += string( i+1 ) + "|00|00|00|";  } 
                    
                }
                
                // Se guarda el contenido el archivo y se hace un salto de línea.
                file_text_write_string(file, str);
                file_text_writeln(file);
            
    // Se cierra el fichero
    file_text_close( file );
    
}

/*

    Orden en que se disponen los datos por línea:
    
        - Datos base de cada sector (numero, desbloqueado, niveles_desbloqueados, ruedas_obtenidas)
        - Datos base de cada nivel (numero, desbloqueado, ruedas obtenidas, orbes_obtenidas )
        
*/
