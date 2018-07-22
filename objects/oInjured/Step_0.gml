/// @description Insert description here
// You can write your code in this editor
if (!dead && ds_map_exists(global.deadInjured, id)){
	dead = true;
}

if (distance_to_object(oPlayer) < 10){
	if gamepad_button_check_pressed(global.gamepad, gp_face3){
		if (!dead){
			if (!active && !completed && ds_map_size(global.activeInjured) == 0){
				ds_map_add(global.activeInjured, id, organNeeded);
				ds_list_add(global.organsToSpawn, organNeeded);
				oGameController.countdown = timer;
				oGameController.active = true;
				oGameController.alarm[0] = room_speed;
				active = true;
			}
			if (canDeliver){
				oGameController.active = false;
				oGameController.completeInjured += 1;
				oGameController.alarm[0] = 0;
				completed = true;
				ds_map_delete(global.activeInjured, id);
				for(var i = 0; i<ds_list_size(global.Inventory);i++){
					item = ds_list_find_value(global.Inventory,i);
	
					if (item == organNeeded){
						ds_list_delete(global.Inventory,i);
						instance_destroy(asset_get_index(item));
					}
	
				}
				// Increment Score
				show_debug_message(id);
				if (global.injuredScores[id]){
					if (oGameController.countdown > global.injuredScores[id]){
						score += oGameController.countdown - global.injuredScores[id];
						global.injuredScores[id] = oGameController.countdown;
						highscore = oGameController.countdown;
					}
				}
				else{
					score += oGameController.countdown;
					global.injuredScores[id] = oGameController.countdown;
					highscore = oGameController.countdown;
				}
			}
		}
		
	}
}