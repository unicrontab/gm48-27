/// @description Level Complete
roomFade = instance_create_layer(x,y,"Transitions",oRoomTransition);
roomFade.targetRoom = levelSelection;
instance_destroy();

if (global.roomScores[room]){
	if (countdown > global.roomScores[room]){
		score += countdown - global.roomScores[room];
		global.roomScores[room] = countdown;
	}
}
else{
	score += countdown;
	global.roomScores[room] = countdown;
}

// Reset all room positions after level complete
ds_map_clear(global.roomPositions);
