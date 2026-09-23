event_inherited()
if (!global.player_alive) {
	return
}
if (cooldown) {
	if (shoot_cooldown_timer >= shoot_cooldown) {
		shoot_cooldown_timer = 0
		cooldown = false
		shooting = true
	}
	shoot_cooldown_timer++;
} else {
	if (shoot_time >= shoot_timer) {
		shoot_time = 0
		shooting = false
		cooldown = true
		x_dist = obj_player.x - x
		y_dist = obj_player.y - y

		angle_to_player = arctan(abs(y_dist) / abs(x_dist))
		var bullet_x_vel = bullet_speed * cos(angle_to_player)
		var x_offset = x + 20 * cos(angle_to_player)
		var y_offset = y + 20 * sin(angle_to_player)
		if (x_dist < 0) {
			bullet_x_vel *= -1
		}
		var bullet_y_vel = bullet_speed * sin(angle_to_player)
		if (y_dist < 0) {
			bullet_y_vel *= -1
		}

		// calculate the bullet x & y vel with player pos
		// spawn the bullet with offset
		// shoot em
		shoot(x_offset, y_offset, {x_vel: bullet_x_vel, y_vel: bullet_y_vel});
	}
	shoot_time++
}

