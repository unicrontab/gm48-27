/// @description Menu Input

keyUp =  keyboard_check_pressed(188) + keyboard_check_pressed(ord("W")) + keyboard_check_pressed(vk_up);
keyDown = keyboard_check_pressed(ord("S")) + keyboard_check_pressed(ord("O")) + keyboard_check_pressed(vk_down);
keyEnter = keyboard_check(vk_enter);

if gamepad_button_check(global.gamepad, gp_start) {
	targetRoom = levelSelection;

	if !instance_exists(oRoomTransition){
		roomFade = instance_create_layer(x,y,"Transitions",oRoomTransition);
		roomFade.targetRoom = targetRoom;
	}
}

if gamepad_button_check_pressed(global.gamepad, gp_face1) || keyEnter {
	if (selected == 1) {
		targetRoom = levelSelection;

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

if (keyDown && selected < options) {
	selected += 1;
} else if (keyUp && selected > 1) {
	selected -= 1;	
}

