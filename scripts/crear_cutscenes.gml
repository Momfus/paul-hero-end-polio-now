///crear_cutscenes( entero )

var tipo = argument0,
    id_cutscenes = instance_create( 0, 0, control_cutscenes );
    
with( id_cutscenes ){

    cutscenes = tipo;
    event_perform( ev_alarm, 0 );

}
