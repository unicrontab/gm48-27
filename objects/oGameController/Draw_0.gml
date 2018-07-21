/// @description Insert description here
// You can write your code in this editor
draw_set_color(global.colors[20]);
draw_set_halign(fa_center);
draw_set_font(font1);

var vx = oCamera.x - 150;
var vy = oCamera.y - 90;

if countdown != noone{
	draw_text(vx + 5, vy + 5, "Time: " + string(countdown));
}