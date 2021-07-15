///string_to_sprite( cadena:texto, boolean:con_borde, ID:color_borde, ID: Halign, ID: Valign)


/* 

 Básciamente este código pasa un texto recibido a un formato de sprite (con o sin borde) del color querido y le coloca su punto de origen segun lo señalado en el 
argumento halign, lo mismo con la centro vertical.

*/


// Declaración de atributos locales
var cadena = argument0, // Texto a convertir
    con_borde = argument1,  // Si se quiere con algun borde (true o false)
    color_borde = argument2, // Color del borde a usar.
    alineacion_horizontal = argument3, // El lugar que se quiere alineado el texto por el origen del sprite.
    alineacion_vertical = argument4, // El lugar que se quiere alineado el texto por el origen del sprite.
    color_texto = draw_get_colour(), // Color texto (el que se venía usando).
    surf = -1, // Surface a utilizar para crear el sprite
    spr = -1, // Sprite a utilizar y que se devuelve el ID (debe borrarse luego)
    cadena_ancho = 0, // Ancho en pixeles de la cadena utilizada
    cadena_alto = 0, // Alto en pixeles de la cadena utilizada
    extra_borde_total = 0, // Ancho X e Y que se agrega por el borde en todal horizontal y verticalmente.
    extra_borde_lado = 0, // El correspondiende al borde agregado en un solo extremo
    cadena_total_ancho = 0, // Total con borde ( si tiene, sino queda igual que cadena_ancho)
    cadena_total_alto = 0, //Total con borde ( si tiene, sino queda igual que cadena_alto)
    origen_x = 0, // Origen del sprite en X
    origen_y = 0; // Origen del sprite en Y
    
    
// Se setean los valores bases para dibujar el texto
draw_set_halign( fa_left );
draw_set_valign( fa_top );

// Se guarda los valores usados de ancho y alto en pixeles del texto
cadena_ancho = string_width( cadena );
cadena_alto = string_height( cadena );    

// Se verifica si se quiere borde, si es asi se modifican los valores correspondiente.
if( con_borde == true ){ 

    extra_borde_total = 4; 
    extra_borde_lado = 2;
        
}

// Se guarda el total de ancho y alto (escencial si habia borde).
cadena_total_ancho = cadena_ancho + extra_borde_total;
cadena_total_alto = cadena_alto + extra_borde_total;

// Se crea el surface a usar.
surf = surface_create( cadena_total_ancho, cadena_total_alto ); 

surface_set_target( surf ); // Se dice que ahora dibuja sobre el surface creado.

    draw_clear_alpha( c_black, 0 ); // Se limpia cualquier rastro gráfico que puede quedar en memoria.
    
    // Se dibuja primero el borde con el color que se dió como parámetro, si es que se quiere.
    if( con_borde == true ){
    
        draw_set_color( color_borde );
        
        draw_text( 0, 0, cadena );
        draw_text( 0, extra_borde_lado, cadena );
        draw_text( 0, extra_borde_total, cadena ); 
        draw_text( extra_borde_lado, extra_borde_total, cadena );
        draw_text( extra_borde_total, extra_borde_total, cadena );
        draw_text( extra_borde_total, extra_borde_lado, cadena );
        draw_text( extra_borde_total, 0, cadena );
        draw_text( extra_borde_lado, 0, cadena );
    
    }
    
    // Se dibujar el texto
    draw_set_color( color_texto );
    draw_text( extra_borde_lado, extra_borde_lado, cadena);
    
surface_reset_target(); // Vuelve a dibujar normalmente;


// Se verifica en que alineación horizontal se quiere el centro del sprite
switch( alineacion_horizontal ){

    // Izquierda.
    case fa_left:{ origen_x = 0; break; }
    
    // Centro
    case fa_center:{ origen_x = (cadena_total_ancho / 2); break; }
    
    // Derecha
    case fa_right:{ origen_x = cadena_total_ancho; break; }

}

// Se verifica en que alineación vertical se quiere el centro del sprite
switch( alineacion_horizontal ){

    // Arriba.
    case fa_top:{ origen_y = 0; break; }
    
    // Medio
    case fa_middle:{ origen_y = ( cadena_total_alto / 2); break; }
    
    // Abajo
    case fa_bottom:{ origen_y = cadena_total_alto; break; }

}

// Se crea el sprite a devolver luego, colocando el origen del mismo en el centro de la cadena recibida.
spr = sprite_create_from_surface( surf, 0, 0, cadena_total_ancho, cadena_total_alto, false, false, origen_x, origen_y );

surface_free(surf); // Se libera de memoria el surface creado.

return spr; // Se devuelve el ID del sprite creado. RECORDAR ELIMINARLO CUANDO NO SE USE MÁS.
    
