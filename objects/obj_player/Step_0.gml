if (global.player_alive == false) {
	return
}

if (dead && global.player_alive == true) {
	audio_play_sound(sfx_squelch, 0, false, 1, 0, random_range(1, 1.3))
	global.player_alive = false
	sprite_index = spr_player_death
	return
}

if (keyboard_check(vk_shift) and stamina > 0) {
	sprint_multiplier = 2
	stamina--
} else {
	sprint_multiplier = 1
	if (stamina < max_stamina) {
		stamina += 0.5
	} else {
		stamina = max_stamina
	}
}

var vertical_movement = keyboard_check(ord("S")) - keyboard_check(ord("W"))
y += vertical_movement * player_speed * sprint_multiplier

var horizontal_movement = keyboard_check(ord("D")) - keyboard_check(ord("A"))
x += horizontal_movement * player_speed * sprint_multiplier

if (vertical_movement != 0 || horizontal_movement != 0) {
	if (sprite_index != spr_player_run) {
		sprite_index = spr_player_run
	}
	if (floor(image_index) == 1 || floor(image_index) == 3) {
		if (!audio_is_playing(sfx_footstep)) {
			audio_play_sound(sfx_footstep, 0, false, 1, 0, random_range(1, 1.5))
		}
	}
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