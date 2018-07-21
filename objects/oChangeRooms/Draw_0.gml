/// @description Insert description here
// You can write your code in this editor

if (distance_to_object(oPlayer) < 10){
	draw_text(x + 12,y - 30, "X to Enter");
	if gamepad_button_check_pressed(global.gamepad, gp_face2){

		pos[0] = oPlayer.x;
		pos[1] = oPlayer.y;
		ds_map_replace(global.roomPosotions, room_get_name(room), pos);
		
		roomFade = instance_create_layer(x,y,"Transitions",oRoomTransition);
		roomFade.targetRoom = nextRoom;
	}
}
