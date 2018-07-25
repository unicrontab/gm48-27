// detectAndSetupGamepad() returns number of connected gamepads

var gamepadCount = gamepad_get_device_count();
var detectedGamepads = 0;
for (var i = 0; i <= gamepadCount; i++;){
	if (gamepad_is_connected(i)){
		detectedGamepads += 1;
		gamepad_set_axis_deadzone(i, 0.2);       // Set the "deadzone" for the axis
		gamepad_set_button_threshold(i, 0.2);    // Set the "threshold" for the triggers
		
		global.gamepad = i;
	}
}

if (detectedGamepads == 0) global.gamepad = noone;
return detectedGamepads;

