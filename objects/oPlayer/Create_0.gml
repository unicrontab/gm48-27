/// @description Init

// ON CREATE OBJECT
tilemap = layer_tilemap_get_id("CollisionTiles");

xspeed = 0;
yspeed = 0;
maxYSpeed = 30;
grav = 0.7;
jumpSpeed = 12;
movespeed = 8;
points = 0;
lastPoints = 0;

// Sprite Info
sprite_bbox_left = sprite_get_bbox_left(sprite_index) - sprite_get_xoffset(sprite_index);
sprite_bbox_right = sprite_get_bbox_right(sprite_index) - sprite_get_xoffset(sprite_index);
sprite_bbox_bottom = sprite_get_bbox_bottom(sprite_index) - sprite_get_yoffset(sprite_index);
sprite_bbox_top = sprite_get_bbox_top(sprite_index) - sprite_get_yoffset(sprite_index);