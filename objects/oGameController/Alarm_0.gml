/// @description Insert description here
// You can write your code in this editor
if !paused{
	countdown -= 1;
}
if countdown > 0{
	alarm[0] = room_speed;
}
else{
	countdown = noone;
	room_restart();
}