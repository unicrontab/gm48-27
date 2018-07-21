/// @description Insert description here
// You can write your code in this editor

if (followTarget == noone){
	//easeScale(1, 1.5, 0.015);
}
else{
	xoffset = 10 * offset;
	xTo = followTarget.x - ((12 + xoffset)  * oPlayer.image_xscale);
	yTo = followTarget.y + (oPlayer.yspeed * 10) - 10;

	x += (xTo - x) / snapSpeed;
	y += (yTo - y) / snapSpeed;
}