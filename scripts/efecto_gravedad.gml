///efecto_gravedad(velocidad_vertical_afectada, factor_gravedad, control_de_aceleración_de_salto)


/*
    
[Explicación de está función]
    
--------- Versión: 
    
              1.0

--------- Funcionamiento y detalles a considerar:
   
         Creado para el juego de Rotary, es usado especificamente para dar gravedad al personaje siempre y cuando
        no se esté realizando una aceleración vertical al mantener la tecla de salto. Finalmente, se retorna la velocidad
        recibida pero modificada con el factor gravedad introducio.
    
--------- Llamado:
    
        efecto_gravedad(velocidad_vertical_afectada, factor_gravedad, control_de_aceleración_de_salto);
        
--------- Ejemplo:
    
        efecto_gravedad( 5, -0.5, keyboard_check_released(ord('J')) );
        
--------- Retorna:
    
        Real
        
--------- Créditos:                         

        Creado por Julián Muñoz Velázquez para Crios' Entertainment & Games.
             
        www.CriosGames.com.ar
        
__________________________________________________________ 
         
    [Parámetros recibidos]
    
    argument0 = Velocidad vertical que se desea modificar por el factor de gravedad
    argument1 = Factor de gravedad.
    argument2 = Valor booleano de la tecla que se necesita mantener presionada para que la gravedad no afecte a la
    aceleración vertical.
    
__________________________________________________________

    [Variables locales]
    
    Idem a las anteriores pero que se les agrega "_local" para tener mayor control.
    
    
__________________________________________________________

    [Código]
    
*/

var vsp_local, grav_local, still_jump_local;
    
vsp_local = argument0;
grav_local = argument1;
still_jump_local = argument2;
    
    
if( still_jump_local == false or vsp_local >= 0 ) { 
    
    if ( vsp_local <= 12 ){ 
        
        vsp_local += grav; 
            
    } 
            
}
    

return vsp_local;
