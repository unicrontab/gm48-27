/// @arg variable

updatedColor = $ffffff;

pos0 = string_char_at(argument0, 1);
pos1 = string_char_at(argument0, 2);
pos2 = string_char_at(argument0, 3);
pos3 = string_char_at(argument0, 4);
pos4 = string_char_at(argument0, 5);
pos5 = string_char_at(argument0, 6);

// updatedColor = pos4 + pos5 + pos2 + pos3 + pos0 + pos1;
updatedColor = make_color_rgb(pos4 + pos5, pos2 + pos3, pos0 + pos1);
show_debug_message(updatedColor);
return updatedColor;
