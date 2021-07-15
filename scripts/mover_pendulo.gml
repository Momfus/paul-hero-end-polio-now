///mover_pendulo( x, y, angulo_inicial, angulo_maximo, factor_cambio, sprite_index, sub_imagen, x_scale, y_scale, depth )

var xx = argument0,
    yy = argument1,
    ang_ini = argument2,
    ang_max = argument3,
    ang_cambio = argument4,
    spr = argument5,
    sub = argument6,
    x_esc = argument7,
    y_esc = argument8,
    profundidad = argument9,
    instancia = instance_create( xx, yy, ob_cutscenes_pendulo );
    
with( instancia ){

    angulo_actual = ang_ini;
    angulo_maximo = ang_max;
    factor_cambio = ang_cambio;
    
    x_escala = x_esc;
    y_escala = y_esc;
    
    sprite_index = spr;
    sub_img = sub;

    depth = profundidad;
            
    activado = true;    

}
