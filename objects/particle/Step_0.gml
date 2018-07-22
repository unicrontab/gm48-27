/// @description Insert description here
// You can write your code in this editor
timeout -= 1;
image_alpha -= fadeSpeed;
image_angle += rotation;

if (timeout <= 0 || opacity <= 0) {
	image_alpha = 0;
	instance_destroy();
}

