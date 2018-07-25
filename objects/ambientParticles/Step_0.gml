if (delayCounter > delay){
		xdistance = random_range(-5,5);
		ydistance = random_range(-5,5);
		ambPart = instance_create_layer(x + xdistance,y + ydistance,"Instances", yellowParticle);
		ambPart.speed = random_range(0.01, 0.2);
		ambPart.rotation = 0;
		ambPart.timeout = 30 * room_speed;
		delayCounter = 0;
}
delayCounter +=1;