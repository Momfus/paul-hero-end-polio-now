///efectos(tipo,velocidad,color)
{

    
    var arg_tipo, arg_velocidad, arg_color;
    
    arg_tipo = argument0;
    arg_velocidad = argument1;
    arg_color = argument2;
    
    with( control_efectos ){
    
        if( activado == false ){
    
            tipo = arg_tipo;
            velocidad  = arg_velocidad;
            color = arg_color;
            
            event_perform( ev_alarm, 0);
        
        }
        else{
        
            show_message("Ya se esta usando el efecto"); // Por ahora, el objeto que controla los efectos, es uno a la vez...sino muestra el mensaje en el compilador
        
        }
        
    }
    
    
    
/*
    
    [Explicación de está función]
    
    --------- Versión: 
    
              1.1

   --------- Funcionamiento y detalles a considerar:
   
          Al llamar esta función se realizan efectos de especiales en pantalla (como fade in/out ) para ciertos momentos que se desee aplicar (como 
        cuando el jugador muere). Lo anterior lo hace llamando a "alarm[0]" de un objeto de control para activarlo y cambiando ciertas propiedades.
         
    --------- Llamado:
    
        efecto(tipo,velocidad,color)    
        
    --------- Ejemplo:
    
        efecto(0,2,c_white)
        
    --------- Retorna:
    
        Nada
        
    --------- Créditos:                         

        Creado por Julián Muñoz Velázquez para Crios Devs.
             
        www.CriosGames.com.ar
        
    __________________________________________________________ 
         
    [Parámetros recibidos]
    
    argument0 = Con un número entero se indica que tipo de efecto se quiere.
        |
        |--->    0 = flash
    
    argument1 = Número entero que señala que tipo de velocidad se quiere.
        |
        |--->   0 = lento
        |--->   1 = medio
        |--->   2 = rapido
        
    argument2 = El color deseado, si es que es posible, para el efecto (hexadecimal o cualquiera de los valores aceptados por Game Maker). Si no se 
    asigna uno, queda en "false".
    
    __________________________________________________________

    [Variables locales]
    
    arg_tipo = argument0
    arg_velocidad = argument1
    arg_color = argument2
    
    
*/
    

}
