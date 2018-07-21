/// @description Movement

if (global.gamepad != noone) {
	lh_axis = gamepad_axis_value(global.gamepad, gp_axislh);
	move = lh_axis;
}

xspeed = move * movespeed;
yspeed += grav;
if (yspeed > maxYSpeed) yspeed = maxYSpeed;

if (sign(xspeed) != 0) {
	image_xscale = sign(xspeed);
}

// Jumping
var t1 = tilemap_get_at_pixel(tilemap, bbox_left, bbox_bottom + 1) & tile_index_mask;
var t2 = tilemap_get_at_pixel(tilemap, bbox_right, bbox_bottom + 1) & tile_index_mask;
if (t1 != 0 || t2 != 0){
	if gamepad_button_check_pressed(global.gamepad, gp_face1){
		yspeed += -jumpSpeed;
	}
}

// Vertical tilemap collision
y += yspeed;
if (yspeed > 0){ // Downward
	var t1 = tilemap_get_at_pixel(tilemap, bbox_left, bbox_bottom) & tile_index_mask;
	var t2 = tilemap_get_at_pixel(tilemap, bbox_right, bbox_bottom) & tile_index_mask;
	
	if (t1 != 0 || t2 != 0){
		y = ((bbox_bottom & ~15) - 1) - sprite_bbox_bottom;
		yspeed = 0;
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

