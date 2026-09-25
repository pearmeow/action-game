event_inherited()
shooting = false
shoot_time = 0
shoot_timer = 120
shoot_color = c_orange
cooldown = true
shoot_cooldown = 30
shoot_cooldown_timer = 0
bullet_speed = 20
bullet_offset = 40
sniper_scale = 2
sniper_reversed = 1 // -1 if it needs to be reversed
sniper_angle = 0

function shoot(bullet_x, bullet_y, bullet_vars) {
	instance_create_depth(bullet_x, bullet_y, 0, obj_bullet, bullet_vars)
	audio_play_sound(sfx_gunshot, 0, false)
}