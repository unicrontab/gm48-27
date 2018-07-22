/// @description Insert description here
// You can write your code in this editor
if !paused{
	countdown -= 1;
}
if countdown > 0{
	alarm[0] = room_speed;
}
if countdown == 0{
	active = false;
	currentInjured = ds_map_find_first(global.activeInjured);
	organ = global.activeInjured[? currentInjured];
	instance_destroy(asset_get_index(organ));
	
	// Remove if in spawner
	for(var i = 0; i<ds_list_size(global.organsToSpawn);i++){
		organToSpawn = ds_list_find_value(global.organsToSpawn,i);
		if (organToSpawn == organ){
			ds_list_delete(global.organsToSpawn,i);
		}
	}
	
	// Remove inventory
	for(var i = 0; i<ds_list_size(global.Inventory);i++){
		item = ds_list_find_value(global.Inventory,i);
		ds_list_delete(global.Inventory,i);
		instance_destroy(asset_get_index(item));
	}
	
	global.deadInjured[? currentInjured] = "dead";
	ds_map_delete(global.activeInjured, currentInjured);
	completeInjured += 1;
}