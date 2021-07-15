///mover_deslizamiento(x_inicial, y_inicial, x_final, y_final, sprite_index, sub_imagen, xscale, yscale, depth)

var xx = argument0,
    yy = argument1,
    xf = argument2,
    yf = argument3,
    mi_sprite = argument4,
    sub = argument5,
    x_esc = argument6,
    y_esc = argument7,
    profundidad = argument8,
    instancia_mover = instance_create( xx, yy, ob_cutscenes_deslizamiento);
    
with( instancia_mover ){

    x_final = xf;
    y_final = yf;
    
    sprite_index = mi_sprite;
    sub_img = sub;

    x_escala = x_esc;
    y_escala = y_esc;
        
    depth = profundidad;
    
    activado = true;    
    
}
