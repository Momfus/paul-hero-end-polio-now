///activado_todo(on_off)

/*

    Este script sirve para detener o activar el movimiento de las trampas y plataformas móviles que haya (segun el argumento ingresado)
    
    argument0 =  on_off = true / false;

*/
{

    var on_off = argument0;

    // Las sierras
    with( parent_sierra ){ activado = on_off; }
    
    // Las plataformas móviles
    with( parent_plat_movil ){ activado = on_off;  }
    
    // Estalactitas
    if( instance_exists( ob_estalactita ) ){
        
        // Se vuelven visibles las estalacticas que han chocado con alguna plataforma
        if( on_off == true ){ 
        
            with( ob_estalactita ){ visible = true; } 
            
        } 
       
        with(ob_estalactita){
           
            image_speed = 0;
                    
            alarm[0] = -1;
            alarm[1] = -1;
            
            timeline_running = false;
                
            vspeed = 0;
            gravity = 0;
                    
            caer = false;
            
            activado = on_off;
        
        }
        
   }
    
    
    // Lanzador de flechas y las flechas en si.
    if( on_off == false ){
    
        with( ob_lanza_flechas ){ alarm[1] = -1; }
        
        with( ob_flecha ){ 
        
            speed = 0; 
            activado = true; 
            
            image_speed = 0;
            
            alarm[0] = -1; }
        
    }
    else{
    
        with( ob_lanza_flechas){ alarm[1] = tiempo; }
    
        with( ob_flecha ){ event_perform(ev_alarm, 0); }
        
    }
    
}
