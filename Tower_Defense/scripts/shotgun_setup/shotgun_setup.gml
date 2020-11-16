function weapon() constructor {
	name = "";
	
	damage = 0;
	fire_rate = room_speed/1.5;
	automatic = true;
	shooting = false;
	
	can_pierce = false;
	pierce_max = 2;
	explode = false;
	
	projectiles = 5;
	projectile_speed = 10;
	projectile_spread_type = 1; //0=linear, 1=equal spacing, 2=randomspread
	projectile_spread_value = 15; //bounding cone. Included angle
	projectile_object = oPlayerBullet;
	
	burst_fire = true;
	burst_delay = 3;
	burst_amount = 3;
	burst_count = 1;
	upgrades = noone;
	upgrade_max = 1;
}

function shotgun() : weapon() constructor {
	name = "Shotgun";
	
	damage = 0;
	fire_rate = room_speed/1.5;
	automatic = true;
	shooting = false;
	
	can_pierce = false;
	pierce_max = 2;
	explode = false;
	
	projectiles = 5;
	projectile_speed = 10;
	projectile_spread_type = 1; //0=linear, 1=equal spacing, 2=randomspread
	projectile_spread_value = 15; //bounding cone. Included angle
	projectile_object = oPlayerBullet;
	
	burst_fire = true;
	burst_delay = fire_rate/6;
	burst_amount = 3;
	burst_count = 1;
	upgrades = noone;
	upgrade_max = 1;
}
	
	//with(global.player){
	//weapon = ds_list_create();
	//weapon[| weapon_stats.total] = 0;
	//weapon[| weapon_stats.damage] = 8;
	//weapon[| weapon_stats.fire_rate] = room_speed/1.5;
	//weapon[| weapon_stats.automatic] = true;
	//weapon[| weapon_stats.shooting] = false;

	//weapon[| weapon_stats.can_pierce] = false;
	////show_message(weapon[| weapon_stats.can_pierce]);
	//weapon[| weapon_stats.pierce_max] = 2;
	//weapon[| weapon_stats.explode] = false;

	//weapon[| weapon_stats.projectiles] = 5;
	//weapon[| weapon_stats.projectile_speed] = 10;
	//weapon[| weapon_stats.projectile_spread_type] = 1; //0=linear, 1=equal spacing, 2=randomspread
	//weapon[| weapon_stats.projectile_spread_value] = 15; //bounding cone. Included angle

	//weapon[| weapon_stats.burst_fire] = true;
	//weapon[| weapon_stats.burst_delay]= weapon[| weapon_stats.fire_rate]/6;
	//weapon[| weapon_stats.burst_amount] = 3;
	//weapon[| weapon_stats.burst_count] = 1;
	//weapon[| weapon_stats.upgrades] = ds_list_create();
	//weapon[| weapon_stats.upgrade_max] = 1;
	//}
	//weapon_defaults = ds_list_create();
	//ds_list_copy(weapon_defaults, weapon)



