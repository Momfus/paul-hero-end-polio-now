///crear_aldeano( numero_id, numero_aldeano, x, y, depth  )

var numero_id = argument0,
    num_ald = string( argument1 ),
    xx = argument2,
    yy = argument3,
    profundidad = argument4,
    instancia = instance_create( xx, yy, ob_aldeanos );
    
with( instancia ){

    aldeano_id = numero_id;
    
    aldeano_enfermo = asset_get_index( "sp_aldeano_enfermo_" + num_ald );
    aldeano_caja = asset_get_index( "sp_aldeano_caja_" + num_ald );
    aldeano_festejo = asset_get_index( "sp_aldeano_festejando_" + num_ald );
    
    depth = profundidad;

}
    
