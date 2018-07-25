/// systemAsyncGetGamepad - Returns gamepad id

event = ds_map_create();

if (async_load[? "event_type"] == "gamepad discovered"){
    var pad = async_load[? "pad_index"];       // Get the pad index value from the async_load map
    gamepad_set_axis_deadzone(pad, 0.5);       // Set the "deadzone" for the axis
    gamepad_set_button_threshold(pad, 0.5);    // Set the "threshold" for the triggers
	
	ds_map_add(event, "connected", pad);
	return event;
    
}
else if (async_load[? "event_type"] == "gamepad lost"){
    var pad = async_load[? "pad_index"];
	
	ds_map_add(event, "disconnected", pad);
	return event;
	
} else {
	show_debug_message(string(async_load[? "event_type"]));
	return noone;
}

