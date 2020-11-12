function update_weapon_stats() {
	with(global.player){
		projectile_spread_value = weapon[| weapon_stats.projectile_spread_value];
		projectiles = weapon[| weapon_stats.projectiles];
		projectile_spread_type = weapon[| weapon_stats.projectile_spread_type];
		projectile_speed = weapon[| weapon_stats.projectile_speed]
		damage = weapon[| weapon_stats.damage];
		//have_pierced = weapon[| weapon_stats.have_pierced];
		pierce_max = weapon[| weapon_stats.pierce_max];
		can_pierce = weapon[| weapon_stats.can_pierce];
		burst_fire = weapon[| weapon_stats.burst_fire];
		//burst_count = weapon[| weapon_stats.burst_count];
		burst_amount = weapon[| weapon_stats.burst_amount];
		burst_delay = weapon[| weapon_stats.burst_delay];
		burst_count = weapon[| weapon_stats.burst_count];
		automatic = weapon[| weapon_stats.automatic];
		fire_rate = weapon[| weapon_stats.fire_rate];
	}


}
