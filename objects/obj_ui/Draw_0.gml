draw_set_halign(fa_right)
draw_text(room_width - 20, 20, "Time survived: " + string(global.time_survived))
if (tutorial_time > 0) {
	draw_set_halign(fa_left)
	draw_text(8, 20, "Shift to run")
	draw_text(8, 40, "Opposite walls are connected but drain max stamina")
	draw_set_halign(fa_center)
	draw_text(room_width / 2, 40, "Make them hit each other")
}

with (obj_player) {
	// draw stamina bar at an offset to the top left corner of the screen
	draw_set_halign(fa_left)
	draw_rectangle(10, 10, 10 + max_stamina, 20, true)
	draw_rectangle(10, 10, 10 + stamina, 20, false)
}