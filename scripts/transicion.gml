///transicion(room, tipo, velocidad)
{

    var arg_nombre_room, arg_tipo, arg_velocidad;
    
    arg_nombre_room = argument0;
    arg_tipo = argument1;
    arg_velocidad = argument2;

    // Se verifica si el "room" recibido existe, de ser así sigue normalmente el código, sino manda un mensaje de error en pantalla.
    
    if( room_exists(arg_nombre_room) ){
    
        with(control_transiciones){
        
            nombre_room = arg_nombre_room;
            tipo = arg_tipo;
            velocidad = arg_velocidad;
        
            event_perform(ev_alarm, 0);
            
        }
        
    }
    else{
    
        show_message("El room " + string( arg_nombre_room ) + " recibido, no existe. Se reiniciara el juego.");
        prueba = true;
        with(control_general){ event_perform(ev_keyrelease, ord('E') ); }
    
    }
      
}

/*
    
    [Explicación de está función]
    
    --------- Versión: 
    
              1.0

   --------- Funcionamiento y detalles a considerar:
   
          Se realiza un cambio de pantalla al "room" indicado con el efecto de transición deseado.
         
    --------- Llamado:
    
        transicion(room, tipo, velocidad)    
        
    --------- Ejemplo:
    
        transicion(room_next(room), 0, 2)
        
    --------- Retorna:
    
        Nada
        
    --------- Créditos:                         

        Creado por Julián Muñoz Velázquez para Crios Devs.
             
        www.CriosGames.com.ar
        
    __________________________________________________________ 
         
    [Parámetros recibidos]
    
    argument0 = Se indica el "id" del "room" que se quiere ir (como room_next(room), nivel_1, etcétera). Si no existe la pantalla indicada, se mustra un
    mensaje de error.
    
    argument1 = Con un número entero se indica que tipo de transición se quiere se quiere.
        |
        |--->    0 = fade out / fade in
    
    argument2 = Número entero que señala que tipo de velocidad se quiere.
        |
        |--->   0 = lento
        |--->   1 = medio
        |--->   2 = rapido
        
    
    __________________________________________________________

    [Variables locales]
    
    arg_nombre_room = argument0
    arg_tipo = argument1
    arg_velocidad = argument2
    
    
*/
