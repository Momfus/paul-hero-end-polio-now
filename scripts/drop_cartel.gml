///drop_cartel(tipo, x, y_inicio, y_final)

/*

    Se crea el cartel del tipo deseado que cae desde desde la altura indicada verticalmente hasta la posición "y_final".

    tipo:   0   = Título del juego
            1   = Menú principal
            2   = Tipos de controles (WASD + J / K)
            3   = Tipos de controles (Flechas + X / Z)  
            4   = Confirmación de cambio de controles.
            5   = Volver atrás.
            6   = Cantidad de ruedas rotarias totales.
            7   = Cantidad de ruedas rotarias de nivel
            8   = Nombre del sector (varia según el mismo)
            9  = Pausa
            10 = Créditos.
            11 = Logo Crios con chaman arriba
            12 = Logo Rotary con la frase.
            
    -------
    Retorna: el ID del cartel elegido.
    
*/

var dar_tipo, xx, yy, yf, id_cartel;

dar_tipo = argument0; // El tipo que se va enviar.
xx = argument1; // Posición horizontal del cartel en pantalla
yy = argument2; // Posicion vertical del cartel inicialmente
yf = argument3; // Posición final al que llega el cartel al caer.

// Se crea el objeto con los valores necesarios.

id_cartel = instance_create( xx, yy, ob_carteles );

with( id_cartel ){

    tipo = dar_tipo;
    posicion_final_y = yf;
    
    event_perform( ev_alarm, 0 );

} 


return id_cartel;
