/// @arg yStart
/// @arg yAmount
/// @arg speed

y += argument[2] * scaleDir;

if y < argument[0] - argument[1]{
   scaleDir = 1;
}
else if y > argument[0] + argument[1]{
	scaleDir = -1;
}