/// @description Insert description here
// You can write your code in this editor

if (followTarget == noone){
	//easeScale(1, 1.5, 0.015);
}
else{
	xoffset = 10 * offset;
	xTo = followTarget.x - ((12 + xoffset)  * oPlayer.image_xscale);
	yTo = followTarget.y + (oPlayer.yspeed * 10) - 10;

	x += (xTo - x) / snapSpeed;
	y += (yTo - y) / snapSpeed;
}

buffer = 1;
xSeed = random_range(0,1);
xdir = 1;
if (xSeed > 0.5) { xdir = -1; } else { xdir = 1 };
xdistance = (random_range(0,1) + buffer) * xdir;

ySeed = random_range(0,1);
ydir = 1;	   	   
if (ySeed > 0.5) { ydir = -1; } else { ydir = 1 };
ydistance = (random_range(0,1) + buffer) * ydir;
				   
if (particleCounter == particleDelay) {
	wRand = irandom_range(0,10);
	if (wRand > 6) instance_create_layer(x + xdistance,y + ydistance,"Instances", whiteParticle);
	pRand = irandom_range(0,10);
	if (pRand > 6) instance_create_layer(x + xdistance,y + ydistance,"Instances", pinkParticle);
	purpRand = irandom_range(0,10);
	if (purpRand > 6) instance_create_layer(x + xdistance,y + ydistance,"Instances", purpleParticle);
	particleCounter = 0;
}
particleCounter += 1;