/// @description Menu Input

if gamepad_button_check(global.gamepad, gp_start){
	targetRoom = level1;

	if !instance_exists(oRoomTransition){
		roomFade = instance_create_layer(x,y,"Transitions",oRoomTransition);
		roomFade.targetRoom = targetRoom;
	}
}

