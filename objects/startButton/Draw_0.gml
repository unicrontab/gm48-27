/// @description Insert description here
// You can write your code in this editor
draw_set_font(minecraft);
draw_set_valign(fa_middle);

if (oMenu.selected != noone && oMenu.selected == selectionId) {
	draw_set_color(global.colors[16]);
	draw_rectangle(x-40,y-7,x+40, y+7,false)
	draw_set_color(global.colors[5]);
} else {
	
	
	draw_set_color(global.colors[16]);
}

draw_text_ext_transformed(x,y,"START",15,300,0.5,0.5,image_angle);