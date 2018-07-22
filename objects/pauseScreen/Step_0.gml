/// @description Insert description here
// You can write your code in this editor

if gamepad_button_check_pressed(global.gamepad, gp_face1){
	if (selected == 1) {
		oGameController.paused = false;
		instance_destroy();
	}
	
	if (selected == 2) {
		game_end();
	}
}


if (global.gamepad != noone) {
	lv_axis = gamepad_axis_value(global.gamepad, gp_axislv);
	if (lv_axis > 0 && selected < options) {
		selected += 1;
	} else if (lv_axis < 0 && selected > 1){
		selected -= 1;	
	}
}
