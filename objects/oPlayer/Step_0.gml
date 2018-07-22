/// @description Movement
keyLeft = keyboard_check(ord("A")) + keyboard_check(vk_left);
keyRight = keyboard_check(ord("E")) + keyboard_check(ord("D")) + keyboard_check(vk_right);
keyUp = keyboard_check_pressed(188) + keyboard_check_pressed(ord("W")) + keyboard_check_pressed(vk_up);
move = keyRight - keyLeft;

if (global.gamepad != noone && !disableJoystick) {
	lh_axis = gamepad_axis_value(global.gamepad, gp_axislh);
	move = lh_axis + keyRight - keyLeft;
}

if (!global.transitioning && !oGameController.paused){
	xspeed = move * movespeed;
	if (wallJumping){
		xspeed += 1 * image_xscale;
	}
	yspeed += grav;
	if (yspeed > maxYSpeed) yspeed = maxYSpeed;

	// Jumping
	var t1 = tilemap_get_at_pixel(tilemap, bbox_left, bbox_bottom + 1) & tile_index_mask;
	var t2 = tilemap_get_at_pixel(tilemap, bbox_right, bbox_bottom + 1) & tile_index_mask;
	var jt1 = tilemap_get_at_pixel(jumpThroughTilemap, bbox_left, bbox_bottom + 1) & tile_index_mask;
	var jt2 = tilemap_get_at_pixel(jumpThroughTilemap, bbox_right, bbox_bottom + 1) & tile_index_mask;
	
	//wall jumping
	var right1 = tilemap_get_at_pixel(tilemap, bbox_right + 1, bbox_top) & tile_index_mask;
	var right2 = tilemap_get_at_pixel(tilemap, bbox_right + 1, bbox_bottom) & tile_index_mask;
	var left1 = tilemap_get_at_pixel(tilemap, bbox_left - 1, bbox_top) & tile_index_mask;
	var left2 = tilemap_get_at_pixel(tilemap, bbox_left - 1, bbox_bottom) & tile_index_mask;
	
	
	if (t1 != 0 || t2 != 0 || jt1 != 0 || jt2 != 0){
		if gamepad_button_check_pressed(global.gamepad, gp_face1) || keyUp {
			yspeed += -jumpSpeed;
			audio_play_sound(jump, 10, false);
		}
	}
	else if (right1 != 0 || right2 != 0){
		if ((gamepad_button_check_pressed(global.gamepad, gp_face1) || keyUp) && canWallJump) {
			audio_play_sound(jump, 10, false);
			canWallJump = false;
			wallJumping = true;
			disableJoystick = true;
			yspeed += -doubleJumpSpeed / 2;
			xspeed -= wallJumpSpeed;
			alarm[0] = room_speed;
			alarm[1] = room_speed / 9;
		}
	}
	else if (left1 != 0 || left2 != 0){
		if ((gamepad_button_check_pressed(global.gamepad, gp_face1) || keyUp) && canWallJump) {
			audio_play_sound(jump, 10, false);
			canWallJump = false;
			wallJumping = true;
			disableJoystick = true;
			yspeed += -doubleJumpSpeed / 2;
			xspeed += wallJumpSpeed;
			alarm[0] = room_speed;
			alarm[1] = room_speed / 9;
		}
	}
	else if (canDoubleJump){
		if gamepad_button_check_pressed(global.gamepad, gp_face1) || keyUp {
			audio_play_sound(jump, 10, false);
			canDoubleJump = false;
			yspeed += -doubleJumpSpeed;
		}
	}
		

	// Vertical tilemap collision
	y += yspeed;
	if (yspeed > 0){ // Downward
		var t1 = tilemap_get_at_pixel(tilemap, bbox_left, bbox_bottom) & tile_index_mask;
		var t2 = tilemap_get_at_pixel(tilemap, bbox_right, bbox_bottom) & tile_index_mask;
		var jt1 = tilemap_get_at_pixel(jumpThroughTilemap, bbox_left, bbox_bottom) & tile_index_mask;
		var jt2 = tilemap_get_at_pixel(jumpThroughTilemap, bbox_right, bbox_bottom) & tile_index_mask;
	
		if (t1 != 0 || t2 != 0 || jt1 != 0 || jt2 != 0){
			y = ((bbox_bottom & ~15) - 0.6) - sprite_bbox_bottom;

			yspeed = 0;
			canDoubleJump = true;
			canWallJump = true;
		}
	}
	else{ // Upward
		var t1 = tilemap_get_at_pixel(tilemap, bbox_left, bbox_top) & tile_index_mask;
		var t2 = tilemap_get_at_pixel(tilemap, bbox_right, bbox_top) & tile_index_mask;
	
		if (t1 != 0 || t2 != 0){
			y = ((bbox_top + 16) & ~15) - sprite_bbox_top;
		
			yspeed = 0;
		}
	}

	// Horizontal tilemap collision
	x += xspeed;
	if (xspeed > 0){ // Right
		var t1 = tilemap_get_at_pixel(tilemap, bbox_right, bbox_top) & tile_index_mask;
		var t2 = tilemap_get_at_pixel(tilemap, bbox_right, bbox_bottom) & tile_index_mask;
	
		if (t1 != 0 || t2 != 0){
			x = ((bbox_right & ~15) - 1) - sprite_bbox_right;
			xspeed = 0;
		}
	}
	else{ // Left
		var t1 = tilemap_get_at_pixel(tilemap, bbox_left, bbox_top) & tile_index_mask;
		var t2 = tilemap_get_at_pixel(tilemap, bbox_left, bbox_bottom) & tile_index_mask;
	
		if (t1 != 0 || t2 != 0){
			x = ((bbox_left + 16) & ~15) - sprite_bbox_left;
			xspeed = 0;
		}
	} 
}

if (global.transitioning || oGameController.paused){
	image_speed = 0;
}
else{
	if (sign(xspeed) != 0) image_xscale = sign(xspeed);

	if (sign(yspeed) < 0) {
		sprite_index = sPlayerJump;
		image_speed = 0;
		image_index = 1;
	} else if (sign(yspeed) > 0) {
		sprite_index = sPlayerFall;
		image_speed = 0;
		image_index = 1;
	} else if (sign(xspeed) != 0) {
		sprite_index = sPlayerRun;
		image_speed = xspeed;
	} else {
		sprite_index = sPlayerIdle;
		image_speed = 1;
	}
}

if (y >= room_height -10){
	oGameController.countdown = 0;
	x = oPlayerRespawn.x;
	y = oPlayerRespawn.y;
}