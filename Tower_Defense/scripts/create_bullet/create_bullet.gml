///@func create_bullet(bullet_object, target_x, target_y, fire_alarm number)
///@argument0 bullet_object
///@argument1 target_x
///@argument2 target_y
///@argument3 fire_alarm number
function create_bullet(argument0, argument1, argument2, argument3) {

	var bullet_object = argument0;
	var target_x = argument1;
	var target_y = argument2;
	var fire_alarm = argument3;

	var calc_direction = point_direction(x, y, target_x, target_y);
	var degree_mod = projectile_spread_value/(projectiles-1);
	var right_projectiles = (projectiles-1)/2;

	//show_debug_message(projectiles);

	for(var i = 0, ilen = projectiles; i < ilen; i++){
		if(projectile_spread_type == 1){
			var new_direction = calc_direction - degree_mod*right_projectiles + i*degree_mod;
		}else if(projectile_spread_type == 2){
			var new_direction = calc_direction + irandom_range(-projectile_spread_value/(2*(i+1)), projectile_spread_value/(2*(i+1)));
		}else{
			var new_direction = calc_direction	
		}
		var bullet = instance_create_depth(x, y, -9, bullet_object);
		bullet.speed = projectile_speed;
		if(projectile_spread_type == 2){
			bullet.speed += irandom_range(-1, 1);
		}
	
		bullet.direction = new_direction;
		bullet.image_angle = new_direction;
		bullet.damage = damage;
		bullet.have_pierced = 0;
		bullet.pierce_max = pierce_max;
		bullet.can_pierce = can_pierce;
		bullet.ignore = array_create(pierce_max)
	}


	if(burst_fire && burst_count < burst_amount){
		alarm[fire_alarm] = burst_delay;
		burst_count++;
	}else if(automatic){
		alarm[fire_alarm] = fire_rate;
		burst_count = 1;
	}


}
