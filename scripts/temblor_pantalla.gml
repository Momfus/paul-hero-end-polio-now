///temblor_pantalla(intensidad, duración)

/*

    Se crea temporalmente una instance del objeto "control_temblor" con cierta intesidad y duración.
    
        intensidad ---> 0   =   Leve
                        1   =   Medio
                        2   =   Fuerte
                        
        duración = steps(alarm)
        
        
    NOTA: Tiene que haber una vista (en este caso la 0) activada para hacerse el efecto de temblor de pantalla.

*/

// Se controla primero que no exista ya un temblor (para no solaparlos), de ser asi se manda el mensaje de error correspondiente.
if not ( instance_exists(control_temblor) ){

var intensidad = argument0,
    duracion = argument1,
    instancia_temblor = instance_create( 0, 0, control_temblor );
    
    with( instancia_temblor ){
    
        mi_intensidad = intensidad;
        alarm[0] = duracion;
        
        event_perform(ev_alarm, 1); // Activa el comienzo del temblor
    
    }
    
}
else{

    show_message("Ya se está realizando este efecto");

}
