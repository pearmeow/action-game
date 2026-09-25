if (keyboard_check(ord("R")) and room == rm_main) {
	global.player_alive = true
	global.time_survived = 0
	obj_player.reset()
	with (obj_enemy) {
		instance_destroy()
	}
	with (obj_spawner) {
		instance_destroy()
	}
	with (obj_ui) {
		reset()
	}
	initialize_enemies()
}

if (after_goto_main) {
	after_goto_main = false
	instance_create_depth(room_width / 2, room_height / 2, 0, obj_player)
	instance_create_depth(room_width / 2, room_height / 2, 0, obj_ui)
	initialize_enemies()
}

if (keyboard_check_pressed(vk_space)) {
	if (room == rm_start) {
		room_goto(rm_main)
		after_goto_main = true
	}
	if (room == rm_end) {
		show_debug_message("end")
		room_goto(rm_start)
	}
}

if (global.player_alive) {
	global.time_survived += 1 / 60
}