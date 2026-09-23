if (keyboard_check(ord("R"))) {
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

if (global.player_alive) {
	global.time_survived += 1 / 60
}