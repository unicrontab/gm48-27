/// @description Pausing
if gamepad_button_check_pressed(global.gamepad, gp_start){
	if paused{
		if (instance_exists(pauseScreen)) instance_destroy(pauseScreen);
		paused = false;
	}
	else{
		instance_create_layer(640,200,"Gui", pauseScreen);
		paused = true;
	}
}

if (!completed && completeInjured == totalInjured){
	completed = true;
	alarm[1] = room_speed * 3;
}