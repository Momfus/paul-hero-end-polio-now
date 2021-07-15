///posicionamiento_escalera(idDeEscalera_ó_cero)
{

  /* Este código establece al jugador los atributos por defecto, cuando se agarra una escalera teniendo en cuenta dos situaciones:
  
        - Si se manda el argumento "cero": quiere decir que el jugador no está justo arriba de la escalera y simplemente lo posiciona en el centro (en 
        este caso esta colisionando y por eso se usa "other")
    
        - Si manda un ID (suponiendo que es de una escalera), posiciona al jugador un poco por debajo de la escalera.
  
  */

        var sobre_escalera = argument0;
        // Se habilita la posibilidad de saltar luego de agarrarse de la escalera.
        still_jump = false;
        en_aire = false;
        can_jump = true;
                    
        // Se colocan todas los estados necesarios que indican que el jugador use la escalera.
                        
        hsp = 0;        //--
        impulso = 0;    //------> Se quita todo atributo de velocidad.
        vsp = 0;        //--
                        
        spr = 0; // Se setea el sprite donde el jugador esta "quieto" sobre la escalera.
        
        if( sobre_escalera == false ){
                        
            // La coordenada "X" del jugador se centra en el medio de la escalera.
            x = other.x + 16;
            
        }
        else{
        
            x = sobre_escalera.x + 16;
            y = sobre_escalera.y + 1;
        
        }
                    
        en_escalera = true; // Al estar activado esto, se desactivan algunas funciones de gravedad y ocurren cambios al movimiento del personaje.    


}
