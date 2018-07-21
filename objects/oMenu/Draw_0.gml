/// @description Placeholder Menu

draw_set_color(global.colors[6]);
draw_set_halign(fa_center);
draw_set_font(Title);

draw_text(camera_get_view_width(view_camera[0]) / 2,
		  camera_get_view_height(view_camera[0]) / 6 + 145, "Donor");
		  
		  
draw_set_font(normal);

draw_text(camera_get_view_width(view_camera[0]) / 2,
		  camera_get_view_height(view_camera[0]) /2 + 145, "Press Start");