///guardar_total_ruedas_nivel(cadena:nombre_archivo, entero:numero_sector, entero:numero_nivel, entero:numero_ruedas, entero:numero_orbes, entero:numero_sumar_ruedas);

// El valor recibido (número entero de dos dígitos) se guarda en la ubicación del nivel que se encuentra el jugador.

var nombre_archivo = argument0; // Nombre del archivo usado para guardar los datos.

// Si el archivo existe se guardan los nuevos datos, caso contrario se muestra un mensaje de error y se reinicia el juego (restaurando dicho archivo).
if( file_exists( nombre_archivo ) ){

    var cadena_datos_sector,
        cadena_datos_nivel,
        numero_sector,
        numero_nivel,
        pos,       
        ruedas_nuevo_valor,
        ruedas_sumar_valor,
        orbes_nuevo_valor,
        file,
        str_aux;

    // Se setean los valores.
    cadena_datos_sector = control_general.datos[0];
    cadena_datos_nivel = control_general.datos[1];
    numero_sector = argument1;
    numero_nivel = argument2;
    ruedas_nuevo_valor = string_replace( string_format(argument3, 2, 0), ' ', '0');
    orbes_nuevo_valor = string_replace( string_format(argument4, 2, 0), ' ', '0');
    ruedas_sumar_valor = argument5;
    str_aux = "";
    
    // << Se cambian los atributos usados directamente para señalar las ruedas totales por sector y en total.
    with( control_general ){
    
        sector_total_ruedas[numero_sector] += ruedas_sumar_valor;
        juego_total_ruedas += ruedas_sumar_valor;
        
    }
    
    // << Cambio de valor de ruedas conseguidas en el nivel >>
    pos = posicion_dato(4, 2, 4, ( numero_sector - 1) * 11 + numero_nivel, 3 );
    
    cadena_datos_nivel = string_delete( cadena_datos_nivel, pos, 2 );
    cadena_datos_nivel = string_insert( ruedas_nuevo_valor, cadena_datos_nivel, pos );

    // << Cambio de valor de orbes máximas conseguidas en el nivel >>
    pos = posicion_dato(4, 2, 4, ( numero_sector - 1) * 11 + numero_nivel, 4 ); 
    
    cadena_datos_nivel = string_delete( cadena_datos_nivel, pos, 2 );
    cadena_datos_nivel = string_insert( ruedas_nuevo_valor, cadena_datos_nivel, pos );
    
    // << Se suma a la cantidad de ruedas que tiene el sector que se está >>
    pos = posicion_dato(4, 2, 4, numero_sector, 4 ); 
    
    while( string_char_at(cadena_datos_sector, pos) != "|"  ){
    
        str_aux += string_char_at(cadena_datos_sector, pos);
        pos++;
    
    }
    
    ruedas_sumar_valor += real(str_aux);
    str_aux = string_replace( string_format(ruedas_sumar_valor, 2, 0), ' ', '0');
    
    // << Se suplanta el valor que hay en la cadena de datos del sector con el valor conseguido antes.
    pos = posicion_dato(4, 2, 4, numero_sector, 4 );
    
    cadena_datos_sector = string_delete( cadena_datos_sector, pos, 2 );
    cadena_datos_sector = string_insert( str_aux, cadena_datos_sector, pos );
    
    // << Se sobreescriben las cadenas usadas para los datos del control_general
    with(control_general){
    
        datos[0] = cadena_datos_sector;
        datos[1] = cadena_datos_nivel;
    
    }
    
    
    /* Se abre el archivo correspondiente y se guarda la nueva cadena (como la cadena debe estar en la segunda linea del texto, se guarda el mismo dato anterior
    y luego se hace el salto de linea) */
    file = file_text_open_write(nombre_archivo);
    
        file_text_write_string(file, control_general.datos[0]);
        file_text_writeln(file);
        file_text_write_string(file, cadena_datos_nivel);
    
    file_text_close( file );
    
    
}
else{

    // Mensaje de error y reinicio de nivel
    show_message("Error - No se encuentra el archivo de guardado");   
    with(control_general){  
     
        prueba = true;
        event_perform(ev_keyrelease, ord("E") );
         
    }
     
}
