if (dead) {
	global.player_alive = false
	room_goto(rm_end)
	return
}

if (keyboard_check(vk_shift) and stamina > 0) {
	sprint_multiplier = 2
	stamina--
} else {
	sprint_multiplier = 1
	if (stamina < max_stamina) {
		stamina += 0.2
	} else {
		stamina = max_stamina
	}
}

var vertical_movement = keyboard_check(ord("S")) - keyboard_check(ord("W"))
y += vertical_movement * player_speed * sprint_multiplier

var horizontal_movement = keyboard_check(ord("D")) - keyboard_check(ord("A"))
x += horizontal_movement * player_speed * sprint_multiplier

if (vertical_movement != 0 || horizontal_movement != 0) {
	sprite_index = spr_player_run
	if (horizontal_movement == -1) {
		image_xscale = -1;
	} else if (horizontal_movement == 1) {
		image_xscale = 1;
	}
} else {
	sprite_index = spr_player_idle
}

// wrap around the room when you get to the edge
if (x < 0) {
	x = room_width
	max_stamina *= 1/2
}
if (x > room_width) {
	x = 0
	max_stamina *= 1/2
}
if (y < 0) {
	y = room_height
	max_stamina *= 1/2
}
if (y > room_height) {
	y = 0
	max_stamina *= 1/2
}

if (max_stamina < 1) {
	player_speed = 1
}

function reset() {
	player_speed = 3
	side_length = 16
	sprint_multiplier = 1
	dead = false
	x = room_width / 2
	y = room_height / 2
	// sprint for 1 second
	stamina = 60
	max_stamina = 60
}