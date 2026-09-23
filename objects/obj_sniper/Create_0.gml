event_inherited()
shooting = false
shoot_time = 0
shoot_timer = 120
cooldown = true
shoot_cooldown = 30
shoot_cooldown_timer = 0
bullet_speed = 40

function shoot(bullet_x, bullet_y, bullet_vars) {
	instance_create_depth(bullet_x, bullet_y, 0, obj_bullet, bullet_vars)
	audio_play_sound(sfx_gunshot, 0, false)
}