/// @description Instantiate Inventory Items
for(var i = 0; i<ds_list_size(global.organsToSpawn);i++){
	organ = ds_list_find_value(global.organsToSpawn,i);
	instance_create_layer(320, 288, "Instances", asset_get_index(organ));
	ds_list_delete(global.organsToSpawn,i);
}

for(var i = 0; i<ds_list_size(global.Inventory);i++){
	item = ds_list_find_value(global.Inventory,i);
	
	if (instance_exists(oInjured)){
		if (item == oInjured.organNeeded){
			oInjured.canDeliver = true;
		}
	}
	
	instance = instance_create_layer(oPlayer.x, oPlayer.y, "Instances", asset_get_index(item));
	ds_list_delete(global.Inventory,i);
}