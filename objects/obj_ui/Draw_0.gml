draw_text(room_width / 2 - 100, 20, "Time survived: " + string(global.time_survived))
if (tutorial_time > 0) {
	draw_text(8, 20, "Shift to run")
	draw_text(8, 40, "Opposite walls are connected but drain max stamina")
	draw_text(room_width / 2 - 100, 40, "Make them hit each other")
}

with (obj_player) {
	// draw stamina bar at an offset to the top left corner of the screen
	draw_rectangle(10, 10, 10 + max_stamina, 20, true)
	draw_rectangle(10, 10, 10 + stamina, 20, false)
}

if (obj_player.dead) {
	draw_text(room_width / 2 - 60, room_height / 2, "You are dead")
	draw_text(room_width / 2 - 60, room_height / 2 + 20, "R to restart")
}