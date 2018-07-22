/// @description Insert description here
// You can write your code in this editor
draw_set_color(global.colors[16]);
draw_set_font(block);

if (!dead){
	if (completed){
		draw_text_ext_transformed(x + 8,y - 30, "That was close!", 5, 300,0.5,0.5,0);
	}
	else if (!active){
		draw_text_ext_transformed(x + 8,y - 30, "Halp!", 5, 300,0.5,0.5,0);
	}
	else if (canDeliver){
		draw_text_ext_transformed(x + 8,y - 30, "Thats it!", 5, 300,0.5,0.5,0);
	}
	else{
		draw_text_ext_transformed(x + 8,y - 30, "I need a " + organText, 5, 300,0.5,0.5,0);
	}
	if (highscore != noone){
		draw_text_ext_transformed(x + 15,y - 40, "Highscore: " + string(highscore), 5, 300,0.5,0.5,0);
	}
}


draw_self();