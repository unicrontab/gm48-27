draw_set_font(minecraft);
draw_set_valign(fa_middle);

if (pauseScreen.selected != noone && pauseScreen.selected == selectionId) {
	draw_set_color(global.colors[16]);
	draw_sprite_ext(sHeart,1,x - 150,y, 8, 8.0, image_angle, c_white, 1);
	show_debug_message("exit is active");
} else {
	draw_set_color(global.colors[16]);
}

draw_set_halign(fa_left);
draw_text_ext_transformed(x,y,"EXIT",15,300,4,4,image_angle);
draw_set_halign(fa_center);
