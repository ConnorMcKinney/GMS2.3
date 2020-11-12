function update_player_stats() {
	with(global.player){
	max_hp = stats[| player_stats.max_hp];
	hp = stats[| player_stats.hp];
	max_speed = stats[| player_stats.max_speed];
	impulse = stats[| player_stats.impulse];
	restitution = stats[| player_stats.restitution];
	dodge_distance = stats[| player_stats.dodge_distance];
	dodge_speed = stats[| player_stats.dodge_speed];
	dodge_time = stats[| player_stats.dodge_time];//dodge_distance/dodge_speed
	dodge_cooldown = stats[| player_stats.dodge_cooldown];
	}


}
