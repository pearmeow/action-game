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
	instance_destroy()
}