/// @description Insert description here
// You can write your code in this editor
draw_set_color(global.colors[16]);
draw_set_font(block);

if (distance_to_object(oPlayer) < 10 and score >= requiredScore && !donateRoomLocked){
	draw_text_ext_transformed(x + 8,y - 30, "X to Enter", 5, 300,0.5,0.5,0);
	if gamepad_button_check_pressed(global.gamepad, gp_face3){
		if (totalInjured != noone && completeInjured != noone){
			oGameController.totalInjured = totalInjured;
			oGameController.completeInjured = completeInjured;
		}
		

		pos[0] = oPlayer.x;
		pos[1] = oPlayer.y;
		ds_map_replace(global.roomPositions, room_get_name(room), pos);
		
		roomFade = instance_create_layer(x,y,"Transitions",oRoomTransition);
		roomFade.targetRoom = nextRoom;
	}
} else if (donateRoomLocked) {
	draw_self();
}

if (score < requiredScore) {
	draw_text_ext_transformed(x + 8,y - 30, "requires " + string(requiredScore) + " points", 5, 300,0.5,0.5,0);
	draw_self();	
} 