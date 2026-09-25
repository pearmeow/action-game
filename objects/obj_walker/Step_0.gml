event_inherited()
if (!global.player_alive) {
	return
}
x_dist = obj_player.x - x
y_dist = obj_player.y - y

angle_to_player = arctan(abs(y_dist) / abs(x_dist))
x_vel = enemy_speed * cos(angle_to_player)
if (x_dist < 0) {
	x_vel *= -1
}
y_vel = enemy_speed * sin(angle_to_player)
if (y_dist < 0) {
	y_vel *= -1
}

image_angle -= 3

x += x_vel
y += y_vel