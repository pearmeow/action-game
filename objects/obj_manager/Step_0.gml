if (after_goto_main) {
	after_goto_main = false
	instance_create_depth(672, 384, 0, obj_player)
	instance_create_depth(room_width / 2, room_height / 2, 0, obj_ui)
	initialize_enemies()
}

if (keyboard_check_pressed(vk_space)) {
	if (room == rm_start) {
		draw_set_font(default_font)
		room_goto(rm_main)
		after_goto_main = true
	}
	if (room == rm_end) {
		global.player_alive = true
		global.time_survived = 0
		room_goto(rm_start)
	}
}

if (global.player_alive && room == rm_main) {
	global.time_survived += 1 / 60
}