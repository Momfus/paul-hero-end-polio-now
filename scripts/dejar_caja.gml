///dejar_caja(dir_donde_mira,posición_x_relativa_positiva,posición_y_relativa_positiva)
{

    // Declacaración de variables locales y asignación de valores con los argumentos.
    var donde_mira, xx, yy;
    
    donde_mira = argument0;
    
    xx = argument1;
    yy = argument2;
    
    // Se señala que ya no se está con la caja y que hasta que se suelte la tecla de interacción, no se puede interactuar con nada mas.
    con_caja = false;
    can_interac = false;
    
    // Se cambia la caja que está arriba usandose por la caja común que es solida y tiene efecto de gravedad.
    with(ob_caja_usando){ instance_change(ob_caja, true); }
    
    mask_index = sp_jug_mov; // Se cambia en este momento la mascara de colisión común del jugador para no tener problemas al dejar justo la caja.
     
    // Coloca la caja en el lugar deseado (delante del jugador):
    with(ob_caja){
    
        x += xx * (donde_mira); // Se multiplica por el atributo "donde_mira" para saber de que lado dejar la caja.
        y += yy;
        
        // Por último, se controla si hay algun tipo de colisión con una pared sólida, si es así, se mueve la caja fuera de la misma.
        if( place_meeting(x, y, parent_plat_solido) ){
        
            var pared = instance_place(x,y,parent_plat_solido);
            
            // Si la pared está a la derecha, se corre a la izquierda la caja.
            if( x < pared.x ){
            
                while( place_meeting(x, y, pared) ){ x -= 1; }
            
            }
            else{ // Si la pared está a la izquierda, se corre a la derecha la caja.
            
                while( place_meeting(x, y, pared) ){ x += 1; }
            
            }
        
        }
        
    }
        
     /*
    
    [Explicación de está función]
    
    --------- Versión: 
    
              1.0

   --------- Funcionamiento y detalles a considerar:
   
         Creado para el juego de Rotary, es usado para simplificar el tema de dejar la caja que está sosteniendo el jugador.
         NOTA: las coordenadas pasados son aplicadas de forma relativa
    --------- Llamado:
    
        dejar_caja(dir_donde_mira,posición_x_relativa_positiva,posición_y_relativa_positiva);
        
    --------- Ejemplo:
    
        dejar_caja( 1,32,20);
        
    --------- Retorna:
    
        Nada
        
    --------- Créditos:                         

        Creado por Julián Muñoz Velázquez para Crios' Entertainment & Games.
             
        www.CriosGames.com.ar
        
    __________________________________________________________ 
         
    [Parámetros recibidos]
    
    argument0 = Entero que representa en que dirección esta mirando el jugador para saber donde dejar la caja (1 = a la derecha; -1 = a la izquierda).
    argument1 = Posición X relativa a la caja donde se quiere dejar (debe ser positivo).
    argument2 = Posición Y relativa a la caja donde se quiere dejar (debe ser positivo).
    
    __________________________________________________________

    [Variables locales]
    
    Idem a las anteriores pero con otro nombre para que sean locales.
    
    
    __________________________________________________________

    */
    
}
