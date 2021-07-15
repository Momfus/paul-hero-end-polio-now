///crear_imagen_alternada( x1, y1, x2, y2, intervalo_cambio_steps, sprite_index, sub_img, x_scale, y_scale, depth )

var xx = argument0,
    yy = argument1,
    x_secundario = argument2,
    y_secundario = argument3,
    steps = argument4,
    spr = argument5,
    sub = argument6,
    x_esc = argument7,
    y_esc = argument8,
    profundidad = argument9,
    instancia = instance_create( xx, yy, ob_cutscenes_imagen_alternado );
    
    
with( instancia ){

    x2 = x_secundario;
    y2 = y_secundario;
    
    intervalo = steps;
    
    sprite_index = spr;
    sub_img = sub;

    x_escala = x_esc;
    y_escala = y_esc;
        
    depth = profundidad;
    
    alarm[0] = intervalo;

}
