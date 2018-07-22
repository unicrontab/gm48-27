/// @description Menu Input

if gamepad_button_check(global.gamepad, gp_start){
	targetRoom = level1;

	if !instance_exists(oRoomTransition){
		roomFade = instance_create_layer(x,y,"Transitions",oRoomTransition);
		roomFade.targetRoom = targetRoom;
	}
}

if gamepad_button_check_pressed(global.gamepad, gp_face1){
	if (selected == 1) {
		targetRoom = level1;

		if !instance_exists(oRoomTransition){
			roomFade = instance_create_layer(x,y,"Transitions",oRoomTransition);
			roomFade.targetRoom = targetRoom;
		}	
	}
	
	if (selected == 2) {
		game_end();
	}
}



/// @description Movement

if (global.gamepad != noone) {
	lv_axis = gamepad_axis_value(global.gamepad, gp_axislv);
	if (lv_axis > 0 && selected < options) {
		selected += 1;
	} else if (lv_axis < 0 && selected > 1){
		selected -= 1;	
	}
}

