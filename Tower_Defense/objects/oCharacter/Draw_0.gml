/// @description 
/// @param
var spr = 0;
var scale = 1;
var ang = abs(player_stats.last_aim_angle);
if (ang <= 60) {
	spr = 1;
	scale = clamp((60-ang/1.3)/60, .75, 1);
} else if (ang >= 120) {
	spr = 0;	
	scale = clamp((ang)/180, .75, 1);
} else if (x > 0) {
	spr = 2	
} else {
	spr = 3	
}
//show_debug_message(scale);
draw_sprite_ext(sPistol_weapon, spr, x + lengthdir_x(32, player_stats.last_aim_angle), -10 + bbox_top + lengthdir_y(32, player_stats.last_aim_angle), 1, scale, player_stats.last_aim_angle, c_white, 1);
draw_self();

