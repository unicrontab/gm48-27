/// @description Movement

if (global.gamepad != noone) {
	lh_axis = gamepad_axis_value(global.gamepad, gp_axislh);
	move = lh_axis;
}

xspeed = move * movespeed;
yspeed += grav;
if (yspeed > maxYSpeed) yspeed = maxYSpeed;

// Jumping
if gamepad_button_check_pressed(global.gamepad, gp_face1){
	if (place_meeting(x, y + 4, oSolid)) {
		yspeed += -jumpSpeed;
	}
}

// Horizontal Movement
if (place_meeting(x + xspeed, y, oSolid)) {
	while (!place_meeting(x + sign(xspeed), y, oSolid)) {
		x += sign(xspeed);	
	}
	xspeed = 0;
}
x += xspeed;

// Vertical Movement
if (place_meeting(x, y + yspeed, oSolid)) {
	while (!place_meeting(x, y + sign(yspeed), oSolid)) {
		y += sign(yspeed);	
	}
	yspeed = 0;
}
y += yspeed;

