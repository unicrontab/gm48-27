/// @description Init

// ON CREATE OBJECT
tilemap = layer_tilemap_get_id("CollisionTiles");

xspeed = 0;
yspeed = 0;
maxYSpeed = 10;
grav = 0.15;
jumpSpeed = 4;
movespeed = 2;
points = 0;
lastPoints = 0;

if (ds_map_exists(global.roomPosotions, room_get_name(room))){
	pos = global.roomPosotions[? room_get_name(room)];
	x = pos[0];
	y = pos[1];
}	

// Start Pos
startX = x;
startY = y;

// Sprite Info
sprite_bbox_left = sprite_get_bbox_left(sprite_index) - sprite_get_xoffset(sprite_index);
sprite_bbox_right = sprite_get_bbox_right(sprite_index) - sprite_get_xoffset(sprite_index);
sprite_bbox_bottom = sprite_get_bbox_bottom(sprite_index) - sprite_get_yoffset(sprite_index);
sprite_bbox_top = sprite_get_bbox_top(sprite_index) - sprite_get_yoffset(sprite_index);
