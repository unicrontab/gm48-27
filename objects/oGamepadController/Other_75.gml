/// @description GamePad Detection

event = asyncGamepadEvents();

if ds_map_exists(event, "connected"){
	show_debug_message("gamepad " + string(event[? "connected"]) + " connected");
	global.gamepad = event[? "connected"];	
}

if ds_map_exists(event, "disconnected"){
	show_debug_message("gamepad " + string(event[? "disconnected"]) + " disconnected");

	if (global.gamepad ==  event[? "disconnected"]){
		global.gamepad = noone;
	}

}

