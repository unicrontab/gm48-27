/// @description Insert description here
// You can write your code in this editor
draw_set_color(global.colors[16]);
draw_set_halign(fa_center);
draw_set_font(Title);

var vx = oCamera.x - 150;
var vy = oCamera.y - 90;

if countdown != noone && active {
	draw_text(oPlayer.x, oPlayer.y - 40, string(countdown));
}
