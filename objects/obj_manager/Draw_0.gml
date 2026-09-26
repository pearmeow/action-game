if (room == rm_start) {
	draw_set_halign(fa_center)
	draw_set_font(big_font)
	draw_text_transformed(room_width / 2, 40, "Game name TBD", 1,1, 0)
	draw_set_font(default_font)
	draw_text(room_width / 2, room_height - 80, "Press space to start")
}

if (room == rm_end) {
	draw_set_halign(fa_center)
	draw_text(room_width / 2, room_height / 2 - 20, "You are dead")
	draw_text(room_width / 2, room_height / 2, "Time survived: " + string(global.time_survived))
	draw_text(room_width / 2, room_height / 2 + 20, "Space to restart")
}