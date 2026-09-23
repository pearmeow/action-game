global.player_alive = true
global.time_survived = 0

instance_create_depth(room_width / 2, room_height / 2, 0, obj_player)
initialize_enemies()
audio_play_sound(bgm_main, 0, true)
draw_set_font(font_add("kubasta.ttf",12, true, false, 32, 128))

function initialize_enemies() {
	instance_create_depth(0, 0, 0, obj_spawner)
	instance_create_depth(0, 0, 0, obj_walker)
	instance_create_depth(0, room_height, 0, obj_walker)
	instance_create_depth(room_width, 0, 0, obj_walker)
	instance_create_depth(room_width, room_height, 0, obj_walker)
}