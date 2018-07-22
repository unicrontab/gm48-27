/// @description Insert description here
// You can write your code in this editor

currentRoomScore = global.roomScores[room];
if (currentRoomScore == noone) currentRoomScore = 0;

draw_sprite_ext(
	sHealth,
	1,
	40,
	40,
	4.0,
	4.0,
	image_angle,
	c_white,
	1.0);

draw_set_font(normal);
draw_set_color(global.colors[1]);
draw_set_halign(fa_left);
draw_set_valign(fa_middle);
draw_text_ext_transformed(
	80, 
	20,
	score,
	5,
	100,
	2.0,
	2.0,
	image_angle);
	
draw_set_halign(fa_center);