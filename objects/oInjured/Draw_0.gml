/// @description Insert description here
// You can write your code in this editor
draw_set_color(global.colors[16]);
draw_set_font(block);
if !active{
	draw_text_ext_transformed(x + 8,y - 30, "Halp!", 5, 300,0.5,0.5,0);
}
else{
	draw_text_ext_transformed(x + 8,y - 30, "I need a " + organText, 5, 300,0.5,0.5,0);
}

if (distance_to_object(oPlayer) < 10){
	if gamepad_button_check_pressed(global.gamepad, gp_face3){
		ds_map_add(global.activeInjured, id, organNeeded);
		ds_list_add(global.organsToSpawn, organNeeded);
		active = true;
		oGameController.countdown = 60;
		oGameController.alarm[0] = room_speed;
		
	}
}
draw_self();