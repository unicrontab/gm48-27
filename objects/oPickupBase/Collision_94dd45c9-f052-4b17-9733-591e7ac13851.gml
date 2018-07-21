/// @description Insert description here
// You can write your code in this editor

if (followTarget == noone){
	oGameController.countdown = 10;
	oGameController.alarm[0] = room_speed;
	followTarget = oPlayer;

	offset = oGameController.itemCount;
	oGameController.itemCount++;
}