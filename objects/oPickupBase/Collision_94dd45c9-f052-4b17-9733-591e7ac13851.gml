/// @description Insert description here
// You can write your code in this editor

if (followTarget == noone){
	followTarget = oPlayer;
	
	offset = ds_map_size(global.Inventory);
	ds_list_add(global.Inventory, object_get_name(object_index));
	repeat(10) {
		instance_create_layer(x + xdistance,y + ydistance,"Instances", whiteParticle);
		instance_create_layer(x + xdistance,y + ydistance,"Instances", pinkParticle);
	}
}

if (!spawnOnPlayer && !havePlayedSound) {
	audio_play_sound(highScore, 100, false);
	havePlayedSound = true;	
}