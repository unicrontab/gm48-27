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

if (!completed && completeInjured == totalInjured && totalInjured != noone){
	completed = true;
	alarm[1] = room_speed * 3;
}


if (countdown != noone && active && playingTicker == false) {
	audio_stop_sound(ambientBackground);
	audio_play_sound(tickTock, 100, true);
	playingTicker = true;
}

if (!active && playingTicker = true) {
	playingTicker = false;
	audio_stop_sound(tickTock);
	audio_play_sound(ambientBackground, 100, true);
	
}