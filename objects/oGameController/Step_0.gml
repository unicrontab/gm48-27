/// @description Pausing
if gamepad_button_check_pressed(global.gamepad, gp_start){
	if paused{
		paused = false;
	}
	else{
		paused = true;
	}
}

if (!completed && completeInjured == totalInjured && totalInjured != noone){
	completed = true;
	alarm[1] = room_speed * 3;
}