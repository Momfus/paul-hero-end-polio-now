///cargar_controles()

// Se cargan los datos relacionados con el control del juego

ini_open("Ajustes.ini");

    // Se cargan en las variables globales (que creó "control_general).
    tipo_control            = ini_read_real("Input", "tipo", 0);
            
    tecla_up                = ini_read_real("Controles", "arriba", 87);
    tecla_down              = ini_read_real("Controles", "abajo", 83);
    tecla_left              = ini_read_real("Controles", "izquierda", 65);
    tecla_right             = ini_read_real("Controles", "derecha", 68);
    tecla_jump              = ini_read_real("Controles", "saltar", 74);
    tecla_interac           = ini_read_real("Controles", "interactuar", 75);
    tecla_salir             = ini_read_real("Controles", "salir", 27);
    
ini_close();

// Segun el tipo de control seleccionado, se guardan los ID sprites relacionados con las teclas.
switch(tipo_control){

    // WASD + J / K
    case 0:{
    
        sprite_tecla_aceptar = sp_key_J_menu;
        
        sprite_tecla_jump = sp_key_J;
        sprite_tecla_interac = sp_key_K;
        sprite_tecla_up = sp_key_W;
        sprite_tecla_right = sp_key_D;
        sprite_tecla_down = sp_key_S
        
        break;
    
    }
    
    // Flechas + X / Z
    case 1:{
    
        sprite_tecla_aceptar = sp_key_X_menu;
        
        sprite_tecla_jump = sp_key_X;
        sprite_tecla_interac = sp_key_Z;
        sprite_tecla_up = sp_key_UP;
        sprite_tecla_right = sp_key_RIGHT;
        sprite_tecla_down = sp_key_DOWN
        
        
    
        break;
    
    }

}
