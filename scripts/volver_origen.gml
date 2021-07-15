///volver_origen()
/*

    Mueve a sus coordenadas y estados iniciales todas las sierras, orbes y plataformas móviles.

*/
{

    // Se considera si está en el sector extra, en ese caso verifica si hay algo invocado por el chaman que debe destruirse).
    if( sector_actual == 6 ){
    
        // Sierras invocadas horizontales.
        if( instance_exists( ob_chaman_sierra_h ) ){ with( ob_chaman_sierra_h ){ instance_destroy(); } }
        
        // Sierras invocadas verticales.
        if( instance_exists( ob_chaman_sierra_v ) ){ with( ob_chaman_sierra_v ){ instance_destroy(); } }
        
    
    }

    // Sierras
    with( parent_sierra ){
    
        x = xo;
        y = yo;
    
        vel = ini_vel;
        
    }
    
    //Estalactitas
    with( ob_estalactita ){
    
        if( y != ystart ){ 
        
            y = ystart; 
            image_index = 0;
            choque = false;
            
        }
    
    }
    
    
    //Orbes 
    instance_activate_object(ob_orbe);
    with( ob_orbe ){ agarrado = false; } // Se setea sus valores iniciales.
    
    // Plataformas móviles
    with( parent_plat_movil ){
    
        x = xo;
        y = yo;
        
        ace = 0.125;
        
        switch( object_index){
        
            case( ob_plat_movil_h): {
            
                hsp = ini_hsp;
                max_h = hsp;
                
                var signo_vel = sign(hsp);
                
                ace = 0.125 * signo_vel;
                
                break;
            
            }
            
            case( ob_plat_movil_v ): {
            
                vsp = ini_vsp;
                max_v = ini_vsp;
                
                var signo_vel = sign(vsp);
                
                ace = 0.125 * signo_vel;
                distancia_actualizada = dis_des_v * signo_vel * (-1);
                
                break;
            
            }
        
        }
        
        
    
    }
    

}
