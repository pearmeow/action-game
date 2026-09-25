draw_self()
draw_sprite_ext(spr_gun, 0, x, y, sniper_scale * sniper_reversed, sniper_scale, sniper_angle, c_white, 1)

if (shooting) {
	draw_set_colour(shoot_color)
	draw_line_width(line_start_x, line_start_y, obj_player.x, obj_player.y, 3)
	draw_set_colour(c_white)
}