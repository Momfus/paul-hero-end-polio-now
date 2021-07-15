///crear_nubes_viento( x, y, velocidad_positiva, nube, sub_imagen, x_scale, y_scale, depth)

var xx = argument0,
    yy = argument1, 
    vel = argument2,
    nube_viento = argument3, // true = usar imagen de nube, false = usar imagen de viento.
    sub = argument4, 
    x_esc = argument5,
    y_esc = argument6,
    profundidad = argument7,
    instancia = instance_create( xx, yy, ob_cutscenes_nubes_viento );
    
with( instancia ){

    velocidad = vel;
    
    if( room == room_intro ){
    
        if( nube_viento == true ){ sprite_index = sp_cutscenes_nube; }
        else{ sprite_index = sp_cutscenes_viento; }
        
    }
    else{
    
        if( nube_viento == true ){ sprite_index = sp_cutscenes_nube_2; }
        else{ sprite_index = sp_cutscenes_viento_2; }
    
    }
    
    sub_img = sub;
    
    x_escala = x_esc;
    y_escala = y_esc;

    depth = argument7;
        
    activado = true;

}
