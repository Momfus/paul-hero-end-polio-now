///menu_configuracion_controles(x_ini, y_ini)

/*

    Función:
        Se crean los carteles con la posición deseada y hacen un leve efecto de rebote. Este código se maneja desde "control_menu_pausa"

*/

// Se crea las variable que guardan el ID necesario para cuando se seleccione una opción, saber a cual hacer el efecto de parpadeo.
cartel_id = 0;

// Se crean los carteles cayendo que señala las opciones disponibles 
var xx, yy, yfinal_1, yfinal_2, imagen_alto, imagen_ancho, y_medio_imagen; 

xx = argument0;
yy = argument1;

imagen_alto = sprite_get_height(sp_cartel_normal);
y_medio_imagen = imagen_alto / 2;


yfinal_1 = yy + imagen_alto;
if( room != room_intro ){ yfinal_2 = yfinal_1 + 50 + imagen_alto; }
else{ yfinal_2 = yfinal_1 + 144 + imagen_alto; }

drop_cartel( 2, xx, yfinal_1 - 32, yfinal_1 ); 
drop_cartel( 3, xx, yfinal_2 - 32, yfinal_2 ); 
    
// Se guardan el centro de cada cartel para posicionar el puntero.

y_centro_cartel_1 = yy + y_medio_imagen;
if( room == room_intro ){ y_centro_cartel_2 = y_centro_cartel_1 + 144 + y_medio_imagen * 2; }

imagen_ancho = sprite_get_width(sp_cartel_normal);

x_puntero = xx + imagen_ancho + 24;
y_puntero = y_centro_cartel_1;
    
// Se llama a la alarma correspondiente para saber si la animación de los carteles al caer ha terminado
alarm[0] = 10;    
