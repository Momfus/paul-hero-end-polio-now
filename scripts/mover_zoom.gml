///mover_zoom( x, y, escala_maxima, factor_incremento, sprite_index, sub_imagen, depth )

var xx = argument0,
    yy = argument1,
    esc_max = argument2,
    inc = argument3,
    spr = argument4,
    sub = argument5,
    profundidad = argument6,
    instancia = instance_create( xx, yy, ob_cutscenes_zoom );
    
with( instancia ){

    escala_maxima = esc_max;
    escala_crecimiento = inc;
    
    sprite_index = spr;
    sub_img = sub;

    depth = profundidad;
        
    activado = true;    

}
