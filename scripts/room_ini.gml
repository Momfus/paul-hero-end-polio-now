///room_ini(tipo_fondo);

var setear = background_exists(background_index[0]);

// Se verifica si el room que se encuentra el jugador ya tiene seteado el tipo de fondo a usar.
if( setear == false){    
        
    var tipo = argument0;
    
    // Se setea el bakground dependiendo el room que se está
    switch( tipo ){
                
        // << Playa >>
        case 0:{
        
            //---> Lo siguiente sete el background para lo que se quedaria en el resto del juego (no la primera vez que se ejecuta)
                room_set_background(room, 0, true, false, bg_playa_cielo, 0, 0, false, false, 0, 0, 1 );
                room_set_background(room, 1, true, false, bg_extra_nubes, 0, 15, true, false, 1, 0, 0.5 );
                room_set_background(room, 2, true, false, bg_playa_mar, 0, 350, true, false, 0.5, 0, 1 );
                room_set_background(room, 3, true, false, bg_playa_mar_lineas, 0, 370, true, false, 1, 0, 1 );
                room_set_background(room, 4, true, false, bg_playa_arena, 0, 440, false, false, 0, 0, 1 );
        
            //--->  Lo siguiente setea el room actual con los background necesariosla primera vez que se ejecuta
                
                // Cielo
                background_index[0] = bg_playa_cielo;
                background_visible[0] = true;
                background_htiled[0] = false;
                background_vtiled[0] = false;
                background_hspeed[0] = 0;
                background_alpha[0] = 1;
                
                // Nubes
                background_index[1] = bg_extra_nubes;
                background_visible[1] = true;
                background_y[1] = 15;
                background_htiled[1] = true;
                background_vtiled[1] = false;
                background_hspeed[1] = 1;
                background_alpha[1] = 0.5;
                
                // Mar (sin lineas)
                background_index[2] = bg_playa_mar;
                background_visible[2] = true;
                background_y[2] = 350;
                background_htiled[2] = true;
                background_vtiled[2] = false;
                background_hspeed[2] = 0.5;
                background_alpha[2] = 1;
                
                // Lineas del maro
                background_index[3] = bg_playa_mar_lineas;
                background_visible[3] = true;
                background_y[3] = 370;
                background_htiled[3] = true;
                background_vtiled[3] = false;
                background_hspeed[3] = 1;
                background_alpha[3] = 1;
                
                
                // Arena
                background_index[4] = bg_playa_arena;
                background_visible[4] = true;
                background_y[4] = 440;
                background_htiled[4] = false;
                background_vtiled[4] = false;
                background_hspeed[4] = 0;
                background_alpha[4] = 1;
          
        
                   
            break;
            
        }
        
        // << Cascada >>
        case 1:{
        
            //---> Lo siguiente sete el background para lo que se quedaria en el resto del juego (no la primera vez que se ejecuta)
                room_set_background(room, 0, true, false, bg_cascada_catarata, 0, 146, false, false, 0, 0, 1 );
                room_set_background(room, 1, true, false, bg_cascada_lineas, 58, 0, false, true, 0, 4, 0.8 );
                room_set_background(room, 2, true, false, bg_cascada_cielo_mar, 0, 0, false, false, 0, 0, 1 );
                room_set_background(room, 3, true, false, bg_cascada_bordes, 0, 50, false, false, 0, 0, 1 );
               
            //--->  Lo siguiente setea el room actual con los background necesarios.
          
            
                // Catarata 
                background_index[0] = bg_cascada_catarata
                background_visible[0] = true;
                background_y[0] = 146;
                background_htiled[0] = false;
                background_vtiled[0] = false;
                background_hspeed[0] = 0;
                background_alpha[0] = 1;
              
                // Lineas
                background_index[1] = bg_cascada_lineas;
                background_visible[1] = true;
                background_x[1] = 58;
                background_y[1] = 0;
                background_vtiled[1] = true;
                background_hspeed[1] = 0;
                background_vspeed[1] = 4;
                background_alpha[1] = 0.8;
                
                // Cielo y Mar 
                background_index[2] = bg_cascada_cielo_mar;
                background_visible[2] = true;
                background_htiled[2] = false;
                background_vtiled[2] = false;
                background_hspeed[2] = 0;
                background_alpha[2] = 1;    
                
                // Bordes
                background_index[3] = bg_cascada_bordes;
                background_visible[3] = true;
                background_y[3] = 50;
                background_htiled[3] = false;
                background_vtiled[3] = false;
                background_hspeed[3] = 0;
                background_alpha[3] = 1; 
        
            break;
        
        }
        
        // << Montaña >>
        case 2:{
        
            //---> Lo siguiente sete el background para lo que se quedaria en el resto del juego (no la primera vez que se ejecuta)
            
                 var color_fondo = make_colour_rgb( 168, 44, 57 );
                room_set_background_colour(room, color_fondo, true);
            
                room_set_background(room, 0, true, false, bg_montania_lava_lineas, 234, 50, false, true, 0, 2, 0.8 );   // Lineas lava
                room_set_background(room, 1, true, false, bg_montania_cielo, 0, 0, false, false, 0, 0, 1 );             // Cielo
                room_set_background(room, 2, true, false, bg_montania_costado, 0, 0, false, false, 0, 0, 1 );            // Bordes montaña
               
            //--->  Lo siguiente setea el room actual con los background necesarios.
            
                // Fondo de todo (para la lava)
                background_colour = color_fondo;
                background_showcolour = true;
                
                // Lineas lava
                background_index[0] = bg_montania_lava_lineas;
                background_visible[0] = true;
                background_x[0] = 234;
                background_y[0] = 50;
                background_vtiled[0] = true;
                background_hspeed[0] = 0;
                background_vspeed[0] = 2;
                background_alpha[0] = 0.8;
                
                // Cielo
                background_index[1] = bg_montania_cielo;
                background_visible[1] = true;
                background_htiled[1] = false;
                background_vtiled[1] = false;
                background_hspeed[1] = 0;
                background_alpha[1] = 1;    
                                
                // Bordes montaña
                background_index[2] = bg_montania_costado;
                background_visible[2] = true;
                background_htiled[2] = false;
                background_vtiled[2] = false;
                background_hspeed[2] = 0;
                background_alpha[2] = 1; 
        
                
            break;
        
        }
        
        // << Cueva >>
        case 3:{
        
             //---> Lo siguiente sete el background para lo que se quedaria en el resto del juego (no la primera vez que se ejecuta)
                room_set_background(room, 0, true, false, bg_cueva, 0, 0, false, false, 0, 0, 1 );
        
            //--->  Lo siguiente setea el room actual con los background necesarios.
            
                // Fondo
                background_index[0] = bg_cueva;
                background_visible[0] = true;
                background_htiled[0] = false;
                background_vtiled[0] = false;
                background_hspeed[0] = 0;
                background_alpha[0] = 1;
                
            break;
        
        }
        
        // << Aldea >>
        case 4:{
        
             //---> Lo siguiente sete el background para lo que se quedaria en el resto del juego (no la primera vez que se ejecuta)
                room_set_background(room, 0, true, false, bg_aldea, 0, 0, false, false, 0, 0, 1 );
        
            //--->  Lo siguiente setea el room actual con los background necesarios.
            
                // Fondo
                background_index[0] = bg_aldea;
                background_visible[0] = true;
                background_htiled[0] = false;
                background_vtiled[0] = false;
                background_hspeed[0] = 0;
                background_alpha[0] = 1;
                
            break;
        
        }
        
        //<< Bosque Oscuro >>
        case 5:{
        
            //---> Lo siguiente sete el background para lo que se quedaria en el resto del juego (no la primera vez que se ejecuta)
        
                var color_fondo = make_colour_rgb( 43, 58, 65 );
                room_set_background_colour(room, color_fondo, true);
                
              //  room_set_background(room, 0, true, false, bg_oscuro_niebla, 0, 30, true, false, 1, 0, 1 );      // Niebla de fondo
                room_set_background(room, 1, true, false, bg_oscuro_arboles, 0, 0, true, false, 0, 0, 1 );      // Árboles
                
            //--->  Lo siguiente setea el room actual con los background necesariosla primera vez que se ejecuta
                
                // Fondo de todo
                background_colour = color_fondo;
                background_showcolour = true;
                
                // Niebla
                background_index[0] = bg_oscuro_niebla;
                background_visible[0] = true;
                background_y[0] = 30;
                background_htiled[0] = true;
                background_vtiled[0] = false;
                background_hspeed[0] = 1;
                background_alpha[0] = 1;
               
                // Árboles 
                background_index[1] = bg_oscuro_arboles;
                background_visible[1] = true;
                background_htiled[1] = false;
                background_vtiled[1] = false;
                background_hspeed[1] = 0;
                background_alpha[1] = 1;    
                
        
            break;
        
        }
        
        //<< Menú Principal >>
        case 6:{
        
             //---> Lo siguiente sete el background para lo que se quedaria en el resto del juego (no la primera vez que se ejecuta)
             
                var color_fondo_mar = make_colour_rgb( 53, 101, 139 );
                room_set_background_colour(room, color_fondo_mar, true);
              
                room_set_background(room, 0, true, false, bg_playa_cielo, 0, 0, false, false, 0, 0, 1 );        // Cielo
                room_set_background(room, 1, true, false, bg_extra_nubes, 0, 15, true, false, 0.5, 0, 0.6 );    // Nubes
                room_set_background(room, 2, true, false, bg_menu_mar_1, 0, 392, true, false, 0.5, 0, 1 );      // Lineas mar derecha
                room_set_background(room, 3, true, false, bg_menu_mar_2, 0, 392, true, false, -0.5, 0, 1 );     // Lineas mar izquierda.
                room_set_background(room, 4, true, false, bg_menu_isla, 200, 170, false, false, 0, 0, 1 );      // Isla
        
            //--->  Lo siguiente setea el room actual con los background necesariosla primera vez que se ejecuta
                
                // Fondo de todo (para el mar)
                background_colour = color_fondo_mar;
                background_showcolour = true;
           
                // Cielo
                background_index[0] = bg_playa_cielo;
                background_visible[0] = true;
                background_htiled[0] = false;
                background_vtiled[0] = false;
                background_hspeed[0] = 0;
                background_alpha[0] = 1;
                
                // Nubes
                background_index[1] = bg_extra_nubes;
                background_visible[1] = true;
                background_y[1] = 15;
                background_htiled[1] = true;
                background_vtiled[1] = false;
                background_hspeed[1] = 1;
                background_alpha[1] = 0.5;
                
                
                // Mar 1
                background_index[2] = bg_menu_mar_1;
                background_visible[2] = true;
                background_y[2] = 392;
                background_htiled[2] = true;
                background_vtiled[2] = false;
                background_hspeed[2] = 0.5;
                background_alpha[2] = 1;
                
                // Mar 2
                background_index[3] = bg_menu_mar_2;
                background_visible[3] = true;
                background_y[3] = 392;
                background_htiled[3] = true;
                background_vtiled[3] = false;
                background_hspeed[3] = -0.5;
                background_alpha[3] = 1;
                
                // Isla
                background_index[4] = bg_menu_isla;
                background_visible[4] = true;
                background_x[4] = 200;
                background_y[4] = 170;
                background_htiled[4] = false;
                background_vtiled[4] = false;
                background_hspeed[4] = 0;
                background_alpha[4] = 1;
        
            break;
        
        }
        
        // << Selección sectores>>
        case 7:{

            //---> Lo siguiente setea el background para lo que se quedaria en el resto del juego (no la primera vez que se ejecuta)
        
                room_set_background(room, 0, true, false, bg_seleccion_sectores, 0, 0, false, false, 0, 0, 1 );
                
            //--->  Lo siguiente setea el room actual con los background necesariosla primera vez que se ejecuta
                // Fondo con transparencia.
                background_index[0] = bg_seleccion_sectores;
                background_visible[0] = true;
                background_htiled[0] = false;
                background_vtiled[0] = false;
                background_hspeed[0] = 0;
                background_alpha[0] = 1;
        
            break;
        
        }
        
        // << Selección niveles >>
        case 8:{

            //---> Lo siguiente setea el background para lo que se quedaria en el resto del juego (no la primera vez que se ejecuta)
        
                room_set_background(room, 0, true, false, bg_seleccion_niveles, 0, 0, false, false, 0, 0, 1 );
                
            //--->  Lo siguiente setea el room actual con los background necesariosla primera vez que se ejecuta
                // Fondo con transparencia.
                background_index[0] = bg_seleccion_niveles;
                background_visible[0] = true;
                background_htiled[0] = false;
                background_vtiled[0] = false;
                background_hspeed[0] = 0;
                background_alpha[0] = 1;
        
            break;
        
        }
                
    }
            
}

// Lo siguiente (como cambia de color de sector en sector pero es el mismo room) se hace aparte.
if( room == room_seleccion_niveles ){

    //---> El color usado de fondo varia según el sector que se está 
    var color_fondo = c_white;
                      
    switch( control_menu_pausa.aux_sector_actual ){
                
        case 1:{ color_fondo = make_colour_rgb( 125, 94, 37 ); break; }     // Playa
        case 2:{ color_fondo = make_colour_rgb( 37, 97, 125 ); break; }     // Cascada
        case 3:{ color_fondo = make_colour_rgb( 85, 66, 25 ); break; }      // Montaña
        case 4:{ color_fondo = make_colour_rgb( 29, 41, 66 ); break; }      // Cueva
        case 5:{ color_fondo = make_colour_rgb( 69, 32, 17 ); break; }      // Aldea  
        case 6:{ color_fondo = make_colour_rgb( 6, 43, 8 ); break; }        // Bosque Oscuro
                        
    }
    
    
    // Fondo de todo 
    background_colour = color_fondo;
    background_showcolour = true;

}

/// Se llama a la alarma que determina si debe o no hacer una animación de fondo.
with( control_general ){

    event_perform( ev_alarm, 4 );

}
