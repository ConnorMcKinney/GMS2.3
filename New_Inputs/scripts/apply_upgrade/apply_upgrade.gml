/// @description read_upgrade(item);
/// @function read_upgrade
/// @param item_id
/// @param weapon
function apply_upgrade(argument0, argument1) {

	var upgrade_id = argument0;
	var _weapon = argument1;

	var enhancements = read_upgrade_array(upgrade_id);
		//damage,
		//fire_rate,
		//can_pierce,
		//pierce_max,
		//projectiles,
		//projectile_speed,
		//projectile_spread_type, //0=linear, 1=equal spacing, 2=randomspread
		//projectile_spread_value, //bounding cone. Included angle

		//burst_fire,
		//burst_delay,
		//burst_amount,
	
		//explode,
		//fire,
		//water,
		//ice,
		//acid,
		//electric,
		//laser,
	
		//total
	for(i=0; i<upgrade_types.total; i++){
		var enhancement_val = enhancements[i];
		if(enhancement_val != "skip"){
			var val = _weapon[| i];
			var str1 = global.upgrade_names[| i] + ": " + string(val);
			if(i == upgrade_types.can_pierce or i == upgrade_types.burst_fire or i == upgrade_types.automatic){ //can_pierce, automatic, burst_fire, all elements
				if(i == upgrade_types.can_pierce){
					_weapon[| i] = enhancement_val
					_weapon[| upgrade_types.pierce_max] = _weapon[| upgrade_types.pierce_max] or 1;
				}else{
					_weapon[| i] = enhancement_val;	
				}
			}else if(i >= upgrade_types.explode && i <= upgrade_types.laser){ //between first and last element
				_weapon[| i] = enhancement_val;
			}else{
				if(i == upgrade_types.projectile_spread_type){
					_weapon[| i] = enhancement_val;
				}else{
					_weapon[| i] += enhancement_val;	
				}	
			}
			show_debug_message(str1 + " --> " + string(_weapon[| i]));
		}
	}

	update_weapon_stats();





}
