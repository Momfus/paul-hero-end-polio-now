///mover_downup(x, y, intervalo_steps, sprite_index, sub_imagen, x_scale, y_scale, depth)

var xx = argument0,
    yy = argument1,
    inter = argument2,
    spr = argument3,
    sub = argument4,
    esc_x = argument5,
    esc_y = argument6,
    profundidad = argument7,
    instancia = instance_create( xx, yy, ob_cutscenes_downup );
    
with( instancia ){

    intervalo_steps = inter;
    sprite_index = spr;
    sub_img = sub;

    x_escala = esc_x;
    y_escala = esc_y;
    
    depth = profundidad;
            
    alarm[0] = intervalo_steps;

}
