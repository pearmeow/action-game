// returns the angle from (x1, y1) to (x2, y2)
// with right as 0 degrees
function find_angle(x1, y1, x2, y2) {
	x_dist = x2 - x1
	y_dist = y2 - y1
	angle_to_player = darctan(y_dist / x_dist)
	// Quadrants go counterclockwise starting right
	if (x_dist > 0 && y_dist < 0) { // Q1
		angle_to_player *= -1
	} else if (x_dist < 0 && y_dist < 0) { // Q2
		angle_to_player = 180 - angle_to_player
	} else if (x_dist < 0 && y_dist > 0) { // Q3
		angle_to_player = 180 + abs(angle_to_player)
	} else { // Q4
		angle_to_player = 360 - angle_to_player
	}
	return angle_to_player
}