///cargar_datos(nombre_archivo_a_cargar);

/*<<< Explicación >>>

     Se lee el archivo "nombre_archivo_a_cargar" y las diferentes líneas del documento se guardan como cadenas cada una en una posición del "arreglo_valores" (que
    es lo que se devuelve)

    ---> Retorna:
    
                Un arreglo.
    
*/

var temp_nombre_archivo, file;

temp_nombre_archivo = argument0;

// << Abrir archivo >>
file = file_text_open_read(temp_nombre_archivo); // Se abre el archivo para leeer con el nombre recibido en la función y se guarda su ID en "file".

// Si el archivo existe (no devolvió "-1") se cargan los datos, caso contrario se muestra un mensaje de error.
if( file != -1 ){ 

    var nombre_archivo, arreglo_datos, linea; 

    temp_nombre_archivo = argument0; // Nombre del archivo a abrir.
    linea = 0; // Señala que posición se va a guardar.
    
    // Si no se ha llegado al final del texto, se sigue hasta que así lo sea.
    while not ( file_text_eof(file) ){
    
        arreglo_datos[linea] = file_text_read_string(file); 
        file_text_readln(file);  // Se realiza un salto de línea.
        linea++;
    
    }
    
    // << RETORNO DE VALOR >>
    return arreglo_datos;
    

}
else{

    show_error( "No se puede cargar los datos requeridos para los sectores. El programa se cerrará", true ); 

    // << RETORNO DE VALOR >>
    return 0;
    
}

// << Cerrar archivo >>
file_text_close(file);
    
