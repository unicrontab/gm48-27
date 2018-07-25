

if (!hasBeenHit){
	repeat (20) {
		xdistance = random_range(-5,5);
		ydistance = random_range(-5,5);

		instance_create_layer(x + xdistance,y + ydistance,"Instances", whiteParticle);
		instance_create_layer(x + xdistance,y + ydistance,"Instances", pinkParticle);
		instance_create_layer(x + xdistance,y + ydistance,"Instances", purpleParticle);
	}
}
hasBeenHit = true;