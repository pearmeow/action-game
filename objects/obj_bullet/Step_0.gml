event_inherited()
if (!global.player_alive) {
	return
}
x += x_vel
y += y_vel

// if outside of view
if (x < -30 or x > room_width + 30 or y < -30 or y > room_height + 30) {
	instance_destroy()
}