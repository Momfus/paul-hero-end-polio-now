///dist_detenerse(velocidad_máxima,factor_aceleración)

{

    /*
    
    [Explicación de está función]
    
    --------- Versión: 
    
              1.0

   --------- Funcionamiento y detalles a considerar:
   
        Calcula por step, cuantos pixeles necesita un objeto con velocidad "V" y un factor de desaceleración "A" para detenerse completamente (con 
    velocidad cero).
    
    --------- Llamado:
    
        dist_deternerse(velocidad_máxima, factor_aceleración);
        
    --------- Ejemplo:
    
        dist_detenerse( 6, 0.5 );
        
    --------- Retorna:
    
        Real.
        
    --------- Créditos:                         

        	Creado por Julián Muñoz Velázquez para Crios' Entertainment & Games.
             
        	www.CriosGames.com.ar
        
    __________________________________________________________ 
         
    [Parámetros recibidos]
    
    argument0 = Velocidad máxima a la que llega el objeto.
    argument1 = Factor de desaceleracion con el que el objeto va deteníendose.
    
    __________________________________________________________

    [Variables locales]
    
    distancia = Valor que se devuelve que indica cuantos pixeles tardará el objeto para detenerse.
    
    
    __________________________________________________________

    [Código]
    
    */

    // Se declaran las variables y se asignan algunos valores.
    var vel_max, desa, distancia;
    
    vel_max = argument0;
    desa = argument1;
    
    // Se calculta la distancia
    distancia = ( ( ( ( vel_max / desa ) - 1 ) * vel_max ) / 2 );

    // Se retorna
    return distancia;
    
}
