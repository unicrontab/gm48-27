/// @description Insert description here
// You can write your code in this editor
organNeeded = noone;
organText = noone;
timer = noone;
active = false;
dead = false;
completed = false;
canDeliver = false;

if (ds_map_exists(global.deadInjured, id)){
	dead = true;
}
else if (ds_map_exists(global.activeInjured, id)){
	active = true;
	organNeeded = global.activeInjured[? id];
}