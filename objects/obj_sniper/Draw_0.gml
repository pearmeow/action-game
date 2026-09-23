draw_self()

if (shooting) {
	show_debug_message("shoot em")
	draw_set_colour(c_orange)
	draw_line_width(x, y, obj_player.x, obj_player.y, 3)
	draw_set_colour(c_white)
}