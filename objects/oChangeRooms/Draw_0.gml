/// @description Insert description here
// You can write your code in this editor

if (distance_to_object(oPlayer) < 10){
	draw_text(x + 12,y - 30, "X to Enter");
	if gamepad_button_check(global.gamepad, gp_face2){
		roomFade = instance_create_layer(x,y,"Transitions",oRoomTransition);
		roomFade.targetRoom = nextRoom;
	}
}
