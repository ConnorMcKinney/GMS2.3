///@func create_bullet(bullet_object, target_x, target_y, fire_alarm number)
///@argument0 bullet_object
///@argument1 target_x
///@argument2 target_y
///@argument3 fire_alarm number
function create_bullet(_weapon, target_x, target_y, fire_alarm) {
	var calc_direction = point_direction(x, y, target_x, target_y);
	var degree_mod = _weapon.projectile_spread_value/(_weapon.projectiles-1);
	var right_projectiles = (_weapon.projectiles-1)/2;

	//show_debug_message(projectiles);

	for(var i = 0, ilen = _weapon.projectiles; i < ilen; i++){
		if(_weapon.projectile_spread_type == 1){
			var new_direction = calc_direction - degree_mod*right_projectiles + i*degree_mod;
		}else if(_weapon.projectile_spread_type == 2){
			var new_direction = calc_direction + irandom_range(-_weapon.projectile_spread_value/(2*(i+1)), _weapon.projectile_spread_value/(2*(i+1)));
		}else{
			var new_direction = calc_direction	
		}
		var bullet = instance_create_depth(x, y, -9, _weapon.projectile_object);
		bullet.speed = _weapon.projectile_speed;
		if(_weapon.projectile_spread_type == 2){
			bullet.speed += irandom_range(-1, 1);
		}
	
		bullet.direction = new_direction;
		bullet.image_angle = new_direction;
		bullet.damage = _weapon.damage;
		bullet.have_pierced = 0;
		bullet.pierce_max = _weapon.pierce_max;
		bullet.can_pierce = _weapon.can_pierce;
		bullet.ignore = array_create(_weapon.pierce_max)
	}


	if(_weapon.burst_fire && _weapon.burst_count < _weapon.burst_amount){
		alarm[fire_alarm] = _weapon.burst_delay;
		_weapon.burst_count++;
	}else if(_weapon.automatic){
		alarm[fire_alarm] = _weapon.fire_rate;
		_weapon.burst_count = 1;
	}


}
