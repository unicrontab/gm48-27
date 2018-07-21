/// @arg minScale
/// @arg maxScale
/// @arg speed

image_xscale += argument[2] * scaleDir;
image_yscale = image_xscale;

if image_xscale < argument[0]{
   scaleDir = 1;
}
else if image_xscale > argument[1]{
	scaleDir = -1;
}