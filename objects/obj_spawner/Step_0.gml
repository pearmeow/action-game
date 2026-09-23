if (!global.player_alive) {
	return
}

if (spawning) {
	if (delay_timer >= spawn_delay) {
		delay_timer = 0
		var rng = random(1);
		// if smaller than both then roll again to determine who spawns
		if (rng < dasher_spawn_chance || rng < sniper_spawn_chance) {
			if (rng < dasher_spawn_chance && rng < sniper_spawn_chance) {
				rng = random(dasher_spawn_chance + sniper_spawn_chance);
				if (rng <= dasher_spawn_chance) {
					instance_create_depth(next_spawn_x, next_spawn_y, 0, obj_dasher)
				} else {
					instance_create_depth(next_spawn_x, next_spawn_y, 0, obj_sniper)
				}
			}
			
		} else {
			instance_create_depth(next_spawn_x, next_spawn_y, 0, obj_walker)
			dasher_spawn_chance = clamp(dasher_spawn_chance * 1.2, 0, 0.67)
			sniper_spawn_chance = clamp(sniper_spawn_chance * 1.2, 0, 0.35)
		}
		spawning = false
		draw_warning = false
	} else {
		draw_warning = true
	}
	delay_timer++
	return
}

if (timer >= spawn_timer) {
	spawn_timer /= 2
	timer = 0
	next_spawn_x = random(room_width)
	next_spawn_y = random(room_height)
	spawning = true
}

timer++

function reset() {
	timer = 0
	spawn_timer = 120
	spawn_delay = 40
	delay_timer = 0
	next_spawn_x = 0
	next_spawn_y = 0
	spawning = false
	dasher_spawn_chance = 0.01
	draw_warning = false
}