/// @description Insert description here
// You can write your code in this editor
draw_set_color(global.colors[16]);
draw_set_font(block);
if (completed){
	draw_text_ext_transformed(x + 8,y - 30, "That was close!", 5, 300,0.5,0.5,0);
}
else if (!active){
	draw_text_ext_transformed(x + 8,y - 30, "Halp!", 5, 300,0.5,0.5,0);
}
else if (canDeliver){
	draw_text_ext_transformed(x + 8,y - 30, "Thats it!", 5, 300,0.5,0.5,0);
}
else{
	draw_text_ext_transformed(x + 8,y - 30, "I need a " + organText, 5, 300,0.5,0.5,0);
}

if (distance_to_object(oPlayer) < 10){
	if gamepad_button_check_pressed(global.gamepad, gp_face3){
		ds_map_add(global.activeInjured, id, organNeeded);
		if (!active && !completed){
			ds_list_add(global.organsToSpawn, organNeeded);
			oGameController.countdown = timer;
			oGameController.alarm[0] = room_speed;
			active = true;
		}
		if (canDeliver){
			oGameController.completeInjured++;
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
			if (oGameController.completeInjured == oGameController.totalInjured){
				oGameController.alarm[1] = room_speed * 3;
			}
		}
		
	}
}
draw_self();