// **********************************************************************************************************************
// Archivo:						loading_screen.js
// Fecha de creación:			13/06/2015
// Autor:						Momfus Arboleo (modifiación del creado por FMS)
// Proyecto:					HTML5
// Descripción:					Barra de carga personalizable
// ----------------------------------------------------------------------------------------------------------------------
// 13/06/2015		V1.0		Momfus
//
// ----------------------------------------------------------------------------------------------------------------------
//	Nota 1: Este archivo está basado en el creador por FMS pero adaptandolo a las necesidades y en español, se explica muchas cosas
//
//  Nota 2: Las variables o parámetros que empiezan con guión bajo indican variables que vienen de GMS
//
// **********************************************************************************************************************

function custom_loading_screen(_graphics, _width, _height, _total, _current, _loadingscreen) {

	//#########################################################################
	//## Se edita lo siguiente para hacer una pantalla de carga customizable ##
	//#########################################################################

	//////////////////////  CONFIGURACIÓN DEL TEXTO //////////////////////

			var loading_text="";									//Texto a mostrar ( si esta vacio, no se muestra)
			var text_style="20px Arial";							//Tipo de fuente a utilizar
			var align_text="center";								//Como se va alinear el texto
			var loading_text_color="rgb(255, 255, 255)";			//El color del texto en RGB
			var text_x_pos= (_width/2);								//Posicion horizontal del texto: usado (_width/2) para el centro
			var text_y_pos= 200;									//Posición vertical del texto: usado (_height/2) para el medio

	/////////////////////  CONFIGURACIÓN DE LA BARRA DE CARGA ////////////////////////////////	

			var barwidth = (_width * 0.7) ;					// El ancho que tendrá en pixeles, en este caso se busca que sea el 70% del ancho de pantalla 
			var barheight = 25;                          	// El alto en pixeles
			var x = (_width - barwidth) / 2;				// La posicion horizontal de la barra
			var y = 170 + (_height - barheight) / 2;		// La posición vertical de la barra
			var w = (barwidth / _total) * _current;         // Variable usada para calcular el ancho mientras se carga el juego NO MODIFICAR
			var border = 5   								// Borde de la barra en pixeles (contorno)
			var border_color= "rgb(0,0,0)";   				// Color del borde
			var bar_bg = "rgb(255,255,255)";   				// Color del fondo de la barra
			var progress_bg = "rgb(255, 140, 0)";  			// Color de la barra de progreso 
			
	///////////////////// CONFIGURACIÓN DEL FONDO (si no hay imagen)  ///////////////////////////////////
			var window_bgd = "rgb(0,0,0)"; 				// Color del fondoBackground color 
			var ls_height = _height;					// Alto de la pantalla de carga (todo lo que vel el usario, no la barra)
			var ls_width = _width;						// Idem que arriba pero el ancho.
			var ls_y_pos = 0;   						// Posición vertical de donde se muestra el fondo
			var ls_x_pos = 0;  							// Idem que arriba pero la horizontal
			
	// #############################################################################################
	// Función: Sirve para centrar algo de texto
	//	_graphics 	-> 		Se establece el contexto de graficos 2D 
	//  x 			->		Coordenada X
	//	y			->		Coordenada Y
	//	colour		->		Color del texto
	//	text		->		Texto a dibujar
	//				
	// #############################################################################################
	function jsDrawCenteredText(_graphics, x, y, colour, text) {
		
		_graphics.fillStyle = colour;
		_graphics.lineStyle = colour;
		_graphics.font = text_style; 
		_graphics.textAlign = align_text;
		_graphics.fillText(text, x, y);
		
	}
	
	//Color del fondo
	_graphics.fillStyle = window_bgd;
	_graphics.fillRect(0, 0, _width, _height);
			
	/* SI el ""splashscreen" de GM está seteado para usarse, y está con el mismo ancho y alto que el 
	canvas, se comienza a dibujar desde la posicion x = 0 e y = 0. */
	if (_loadingscreen){
				
		_graphics.drawImage(_loadingscreen, ls_x_pos, ls_y_pos, ls_width, ls_height);
			
	} 

	// Se dibuja la barra sólamente si hay algo cargado del archivo
	if (_current != 0){
	
		// Bordes
		_graphics.fillStyle = border_color;  
		_graphics.fillRect(x-border, y-border, barwidth+(border*2), barheight+(border*2));

				
		// Fondo de la barra
		_graphics.fillStyle = bar_bg;
		_graphics.fillRect(x, y, barwidth, barheight);

		// Barra de progreso
		_graphics.fillStyle = progress_bg;
		_graphics.fillRect(x, y, w, barheight);

		// Dibuja el texto
		//jsDrawCenteredText(_graphics, text_x_pos, text_y_pos, loading_text_color, loading_text);
			
	}

}
