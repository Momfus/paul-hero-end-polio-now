///abajo_plataforma_y(x, y, rep_limite, defecto_y)
{


    var xx, yy, plataforma_id, temp_name, rep_limite, cord_y, defecto_y;
    
    xx = argument0;
    yy = argument1;
    rep_limite = argument2;
    defecto_y = argument3;
    
    cord_y = 0;
    
    
    // Se repite una cantidad "rep_limite" de veces si hay una plataforma de tipo "ob_plat_wall" o "ob_plat_cloud_static" debajo.
    repeat(rep_limite){
    
        yy += 16;
        if( place_meeting(xx, yy, parent_plat) ){
        
            plataforma_id = instance_place(xx, yy, parent_plat);
            temp_name = object_get_name( plataforma_id.object_index )
            if( temp_name == "ob_plat_wall" or temp_name == "ob_plat_cloud_static" ){
            
                cord_y = plataforma_id.bbox_top;
                
                break; // Sale de la repetición al encontrar la plataforma.
            
            }
        
        }
    
    }
    
    // Si no se encontro nada (no cambió el valor de cord_y) se asigna una por defecto.
    if( cord_y == 0 ){ cord_y = defecto_y; }
    
    return cord_y;
    
}


/*
    
    [Explicación de está función]
    
    --------- Versión:  1.0

    --------- Funcionamiento y detalles a considerar:
   
        Devuelve la coordenada superior (de la máscara de colisión) del suelo más próximo que este debajo desde la coordenada "x" recibida, en caso de no
   hayarlo prueba el procedimiento según el número de "rep_límites" dado. Si no encuentra nada al terminar la función, se asigna un tope inferior que es 
   el valor enviado como "defecto_y". Se toman en cuenta solo las plataformas sólidas (no la 
   caja) y los "cloud_platform".
    
    --------- Llamado: abajo_plataforma_y(x, y, rep_limite)
        
    --------- Ejemplo: abajo_plataforma_y(x + 16, y, 6)
        
    --------- Retorna: Real.
        
    --------- Créditos:                         

        Creado por Julián Muñoz Velázquez para Crios Devs.
             
        www.CriosGames.com.ar
        
    __________________________________________________________ 
         
    [Parámetros recibidos]
    
    argument0 = Coordenada "x" desde donde se calcula la distancia hacia abajo.
    argument1 = Coordenada "y" desde donde se calcula la distancia hacia abajo.
    argument2 = Cantidad de veces que debe comprobar hacia abajo.
    argument3 = Valor por defecto que se asigna a lo que se retorna en el caso que en la repetición no se encontrara nada.
    
    __________________________________________________________

    [Variables locales]
    
    xx = Idem 'argument0'
    
    yy = Idem 'argument1' pero se ira incrementando para ir comprobando en cada repetición.
    
    plataforma_id = Valor "id" de la plataforma requerida.
    
    temp_name = Nombre del objeto que se encuentra por debajo (al ser una plataforma).
    
    rep_limite = Idem 'argument2'.
    
    cord_y = Coordenada "Y" devuelta.
    
    defecto_y = Idem 'argument3'.
    
*/
