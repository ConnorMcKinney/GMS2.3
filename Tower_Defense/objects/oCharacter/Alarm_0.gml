/// @description Shooting
// You can write your code in this editor

//var bullet_object = argument0;
//var target_x = argument1;
//var target_y = argument2;
//var fire_alarm = argument3;

if(weapon.shooting){
	if (this_gamepad_id == -1) {
		create_bullet(weapon, mouse_x, mouse_y, 0);
	} else {
		create_bullet(weapon, x + player_stats.last_aim[0], y + player_stats.last_aim[1], 0);//INPUT_STATES[player_id_num, input_action.analogue_rx], y + INPUT_STATES[player_id_num, input_action.analogue_ry], 0);	
	}
}