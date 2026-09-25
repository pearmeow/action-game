global.player_alive = true
global.time_survived = 0

audio_play_sound(bgm_main, 0, true)
font_add_enable_aa(false)
draw_set_font(font_add("kubasta.ttf",12, true, false, 32, 128))
after_goto_main = false

function initialize_enemies() {
	instance_create_depth(0, 0, 0, obj_spawner)
	instance_create_depth(0, 0, 0, obj_walker)
	instance_create_depth(0, room_height, 0, obj_walker)
	instance_create_depth(room_width, 0, 0, obj_walker)
	instance_create_depth(room_width, room_height, 0, obj_walker)
}