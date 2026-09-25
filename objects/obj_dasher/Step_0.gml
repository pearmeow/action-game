event_inherited()
if (!global.player_alive) {
	return
}
if (dashing) {
	x += x_vel
	y += y_vel
	dash_timer += 1
	if (dash_timer >= dash_time) {
		dash_timer = 0
		dashing = false
	}
	// dash and terrorize the player
	return
}

if (windup_timer >= windup_time) {
	dashing = true
	windup_timer = 0
	// only do this calculation once cuz we don't want the
	// dash to rubberband back when it reaches the player pos
	x_dist = tracked_player_pos[0] - x
	y_dist = tracked_player_pos[1] - y

	angle_to_player = arctan(abs(y_dist) / abs(x_dist))
	x_vel = enemy_speed * cos(angle_to_player)
	if (x_dist < 0) {
		x_vel *= -1
	}
	y_vel = enemy_speed * sin(angle_to_player)
	if (y_dist < 0) {
		y_vel *= -1
	}
} else { // track player
	angle_to_player = find_angle(x, y, tracked_player_pos[0], tracked_player_pos[1])
	// add own image angle to smooth out turning
	image_angle = (image_angle + (angle_to_player - 90)) / 2
}

if (windup_timer < tracking_time) {
	tracked_player_pos = [obj_player.x, obj_player.y]
}

windup_timer += 1