event_inherited()
if (!global.player_alive) {
	return
}

// correctly angle sniper

if (obj_player.x < x) {
	image_xscale = -1
	sniper_reversed = -1
} else {
	image_xscale = 1
	sniper_reversed = 1
}

sniper_angle = find_angle(x, y, obj_player.x, obj_player.y)
if (sniper_reversed == -1) {
	sniper_angle += 180
}

var x_dist = obj_player.x - x
var y_dist = obj_player.y - y
var angle_to_player = arctan(abs(y_dist) / abs(x_dist))
line_start_x = x + sign(x_dist) * (bullet_offset - 20) * cos(angle_to_player)
line_start_y = y + sign(y_dist) * (bullet_offset - 20) * sin(angle_to_player)

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
		shoot_color = c_orange

		// math to determine bullet trajectory + spawn distance from the sniper
		var bullet_x_vel = bullet_speed * cos(angle_to_player) * sign(x_dist)
		var bullet_y_vel = bullet_speed * sin(angle_to_player) * sign(y_dist)
		var x_offset = x + sign(x_dist) * bullet_offset * cos(angle_to_player)
		var y_offset = y + sign(y_dist) * bullet_offset * sin(angle_to_player)
		
		var bullet_angle = find_angle(x, y, obj_player.x, obj_player.y)
		shoot(x_offset, y_offset, {x_vel: bullet_x_vel, y_vel: bullet_y_vel, image_angle: bullet_angle})
	}
	
	// flicker when almost shooting
	if (shoot_timer - shoot_time < 25) {
		if (shoot_color == c_orange) {
			shoot_color = c_white
		} else {
			shoot_color = c_orange
		}
	}
	shoot_time++
}

