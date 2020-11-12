/// @description Shooting
// You can write your code in this editor

//var bullet_object = argument0;
//var target_x = argument1;
//var target_y = argument2;
//var fire_alarm = argument3;

if(weapon[| weapon_stats.shooting]){
	script_execute(create_bullet, oPlayerBullet, mouse_x, mouse_y, 0)
	//var bullet = instance_create_layer(x, y, "Instances", oPlayerBullet)
	//bullet.direction = point_direction(x, y, mouse_x, mouse_y)
	//bullet.speed = 20
	//bullet.hspeed += hspeed*shot_speed_inheritance
	//bullet.vspeed += vspeed*shot_speed_inheritance
	////show_debug_message("Shoot")	
	//alarm[0] = fire_rate
}