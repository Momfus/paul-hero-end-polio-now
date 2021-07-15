///setear_controles(entero:tipo_de_control)

// Según el tipo recibido ( 0 = WASD; 1 = Flechas ), se abre el archivo ".ini" correspondiente y se colocan los valores necesarios.

var tipo = argument0;

ini_open("Ajustes.ini");

    ini_write_real('Input', 'seteado', 1);
    ini_write_real('Input', 'tipo', tipo);
    
    // Según el tipo recibido, se configura las teclas necesarias.
    switch(tipo){
    
        // WASD + J / K
        case 0:{
    
            ini_write_real( 'Controles', 'arriba', 87 );
            ini_write_real( 'Controles', 'abajo', 83 );
            ini_write_real( 'Controles', 'izquierda', 65 );
            ini_write_real( 'Controles', 'derecha', 68 );
            ini_write_real( 'Controles', 'saltar', 74 );
            ini_write_real( 'Controles', 'interactuar', 75 );
            ini_write_real( 'Controles', 'salir', 27 );
            
            
            break;
        
        }
    
        // Flechas + X / Z
        case 1:{
        
            ini_write_real( 'Controles', 'arriba', 38 );
            ini_write_real( 'Controles', 'abajo', 40 );
            ini_write_real( 'Controles', 'izquierda', 37 );
            ini_write_real( 'Controles', 'derecha', 39 );
            ini_write_real( 'Controles', 'saltar', 88 );
            ini_write_real( 'Controles', 'interactuar', 90 );
            ini_write_real( 'Controles', 'salir', 27 );
        
            break;
        
        }
        
    }

ini_close();
