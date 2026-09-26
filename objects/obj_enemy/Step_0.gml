if (!global.player_alive) {
	return
}

var collided = instance_place(x, y, [obj_enemy, obj_player])
if (collided != noone) {
	if (collided.object_index == obj_player) {
		collided.dead = true
	} else {
		hp -= 1
		collided.hp -= 1
	}
}

if (hp <= 0) {
	dead = true
}

if (dead) {
	// spawn an object that destroys itself on animation end
	if (death_sprite != spr_empty) {
		instance_create_depth(x, y, 0, obj_death, {sprite_index: death_sprite, image_angle})
	}
	if (death_sound != sfx_empty) {
		if (!audio_is_playing(death_sound)) {
			audio_play_sound(death_sound, 0, false)	
		}
	}
	instance_destroy()
}