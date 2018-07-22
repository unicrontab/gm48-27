/// @description Insert description here
// You can write your code in this editor
organNeeded = noone;
organText = noone;
timer = noone;
highscore = noone;
active = false;
dead = false;
completed = false;
canDeliver = false;

if (global.injuredScores[id]){
	highscore = global.injuredScores[id];
}

if (ds_map_exists(global.deadInjured, id)){
	dead = true;
}
else if (ds_map_exists(global.activeInjured, id)){
	active = true;
	organNeeded = global.activeInjured[? id];
}