if (follow != noone) {
	xTo = follow.x + (15 * oPlayer.image_xscale);
	yTo = follow.y + (oPlayer.yspeed * 15);
}

// Update camera pos
x += (xTo - x) / snapSpeed;
y += (yTo - y) / snapSpeed;


// Shakes
if (shakeLength != 0) {
	x += random_range(-shakeRemaining, shakeRemaining);
	y += random_range(-shakeRemaining, shakeRemaining);
	shakeRemaining = max(0, shakeRemaining - ((1/shakeLength) * shakeIntensity));	
}



var viewMatrix = matrix_build_lookat(x, y, -10, x, y, 0, 0, 1, 0);
camera_set_view_mat(camera, viewMatrix);
