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
		create_bullet(weapon, x + INPUT_STATES[player_id_num, input_action.analogue_rx], y + INPUT_STATES[player_id_num, input_action.analogue_ry], 0);	
	}
	//var bullet = instance_create_layer(x, y, "Instances", oPlayerBullet)
	//bullet.direction = point_direction(x, y, mouse_x, mouse_y)
	//bullet.speed = 20
	//bullet.hspeed += hspeed*shot_speed_inheritance
	//bullet.vspeed += vspeed*shot_speed_inheritance
	////show_debug_message("Shoot")	
	//alarm[0] = fire_rate
}