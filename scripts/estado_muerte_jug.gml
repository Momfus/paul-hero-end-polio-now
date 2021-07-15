#define estado_muerte_jug
///estado_muerte_jug( posición_x_inicio, posición_y_inicio)
{

    /*
    
         Coloca los atributos básicos del jugador y su posición al estado inicial en el que estaban, luego se desactiva hasta que algun evento externo
        lo vuelva a activar. También se tiene en cuenta si hay una caja en pantalla o si se estaba usando (haciendo que reinicie su estado).
    
    */

    
    // Se detiene cualquier sonido que este reproduciendose.
    audio_group_stop_all( audiogroup_default );
    
    // No se permite hacer pausa.
    with( control_menu_pausa ){ can_pausa = false; }
    
    // Se guardan las coordenandas recibidas.
    var ini_x, ini_y;
    
    ini_x = argument0;
    ini_y = argument1;
    
    // Setear los atributos básicos del jugador.
    still_jump = true;
    
    en_aire = false;
    
    hsp = 0;
    vsp = 0;
    impulso = 0;
    
    en_escalera = false;
    can_escalera = true;
    
    can_bajar_plat = true;
    
    show_popup = 0;
    
    spr = 0;
    
    can_interac = true;
    
    accion = 0;    
    
    pitch_orbe = 1;
    
    
    // Verifica si el jugador estaba sobre una plataforma móvil, en ese caso indica al mismo y a esa plataforma que ya lo está para evitar errores.
    if( plat_movil_id != 0 ){
    
        with(plat_movil_id){ move_jug = false; }
        plat_movil_id = 0;
    
    }
    
    // Se crea la instancia que maneja la animación y muerte del jugador.
    instance_create( x, y, ob_jug_muerte);
    
    // Se detiene el movimiento de las sierras y plataformas móviles.
    activado_todo(false);
    
    /* Si existe una caja o se estaba llevando una, se señala que se tome en cuenta su existencia a "ob_jug_muerte" y en el caso último se señala que
    el jugador ya no lleva esa caja. Si la caja estaba colisionando con algun pinche o algo que la destruya, desaparece temporalmente.*/
    if( object_exists(ob_caja) || con_caja == true ){
        
        ob_jug_muerte.caja_existe = true;
    
        if( con_caja == true ){ 
    
            with(ob_caja_usando){ instance_change(ob_caja, true ); } 
            
            con_caja = false;
            
            with(ob_caja){
            
                // Se crean pedazos de caja rota en cantidad aleatoria.
                var cantidad = 4 + irandom(8),
                    medio_caja_x = x + 16,
                    medio_caja_y = y + 16;
                
                repeat( cantidad ){ instance_create( medio_caja_x, medio_caja_y, ob_caja_pedazos ); }
                
                // Se desactiva la caja para no verse mas.
                instance_deactivate_object(ob_caja);
                
                //Sonido que se destruye la caja.
                audio_play_sound( sn_caja_rota, 1, false );
                
            }
        
        }
        else{
        
            with(ob_caja){
        
                if( place_meeting(x, y, parent_danio) ){
                
                    // Se crean pedazos de caja rota en cantidad aleatoria.
                    var cantidad = 4 + irandom(8),
                        medio_caja_x = x + 16,
                        medio_caja_y = y + 16;
                    
                    repeat( cantidad ){ instance_create( medio_caja_x, medio_caja_y, ob_caja_pedazos ); }
                    
                    // Se desactiva la caja para no verse mas.
                    instance_deactivate_object(self);
                
                    //Sonido que se destruye la caja.
                    audio_play_sound( sn_caja_rota, 1, false );
                    
                }
        
            }
        
        }
    
    }
    
    
    // Se posiciona el jugador en las coordenadas recibidas.
    x = ini_x;
    y = ini_y;
   
 
    // Se saca temporalmente la flecha que apunta al punto de entrega o la caja (luego se activa cuando re-aparece el jugador)
    ob_punto_entrega.apuntar_flecha = 2;
    
   //[MÚSICA] Se preoduce la música pequeña cuando muere el jugador
    
    with( control_general ){ 
    
        audio_sound_gain( musica_principal, 0, 0 );
        audio_pause_sound( musica_principal ); // Se detiene temportalmente la música que se esuchaba.
    
        // Se establece cual es la música de muerte y se reproduce
        musica_secundaria = music_muerte; 
        audio_play_sound( musica_secundaria, volumen_musica, false );    
        
    }

    //[Background] Se detiene temporalmente cualquier animación que haya de fondo según el sector que se está
    background_detener(true);
      
}

#define background_detener
///background_detener(boolean:true_parar/false_seguir)

// Según el tipo de fondo (variable room) que se esté, se verfica las cosas a mover o detener.

if( argument0 == true ){

    switch(tipo_fondo){ 
    
        // Playa
        case 0:{ 
        
            background_hspeed[1] = 0; 
            background_hspeed[2] = 0;
            background_hspeed[3] = 0;
            
            break; 
            
        }
        
        // Cascada
        case 1:{ background_vspeed[1] = 0; break; } 
    
    }
    

}
else{

    switch( tipo_fondo){
    
        // Playa
        case 0:{ 
        
            background_hspeed[1] = 1; 
            background_hspeed[2] = 0.5;
            background_hspeed[3] = 1;
                        
            break; 
            
        }
        
        // Cascada
        case 1:{ background_vspeed[1] = 4; break; }
    
    }

}