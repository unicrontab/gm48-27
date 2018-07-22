/// @description Insert description here
// You can write your code in this editor
draw_set_color(global.colors[16]);
draw_set_font(block);
draw_set_halign(fa_center);

verticalPadding = 50;

if (!dead){
	if (completed){
		draw_text_ext_transformed(x + 8,y - verticalPadding, "That was close!", 5, 300,0.5,0.5,0);
	}
	else if (!active){
		draw_text_ext_transformed(x + 8,y - verticalPadding, "Halp!", 5, 300,0.5,0.5,0);
	}
	else if (canDeliver){
		draw_text_ext_transformed(x + 8,y - verticalPadding, "Thats it!", 5, 300,0.5,0.5,0);
	}
	else{
		draw_text_ext_transformed(x + 8,y - verticalPadding, "I need a " + organText, 5, 300,0.5,0.5,0);
	}
	if (highscore != noone){
		draw_text_ext_transformed(x + 8,y - verticalPadding - 20, "Highscore: " + string(highscore), 5, 300,0.5,0.5,0);
	}
}


if (!dead && !completed && (!active || canDeliver) && distance_to_object(oPlayer) < 10) {
	if (global.gamepad != noone) draw_sprite_ext(xPad, 1, x + 8, y - 30,1,1,image_angle,c_white,1);
	if (global.gamepad == noone) draw_text_ext_transformed(x + 8,y + 10, "Press Enter", 5, 300,0.5,0.5,0);
}


draw_self();