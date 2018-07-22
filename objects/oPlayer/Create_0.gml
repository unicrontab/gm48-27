/// @description Init

// ON CREATE OBJECT
tilemap = layer_tilemap_get_id("CollisionTiles");
jumpThroughTilemap = layer_tilemap_get_id("JumpThroughTiles");

xspeed = 0;
yspeed = 0;
maxYSpeed = 10;
grav = 0.15;
jumpSpeed = 4;

wallJumpSpeed = 10;
doubleJumpSpeed = 3;
canDoubleJump = true;
canWallJump = true;
wallJumping = false;
disableJoystick = false;

movespeed = 2;
points = 0;
lastPoints = 0;

if (ds_map_exists(global.roomPositions, room_get_name(room))){
	pos = global.roomPositions[? room_get_name(room)];
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
