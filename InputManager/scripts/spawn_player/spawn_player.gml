/// @arg player_id_to_spawn
function spawn_player(argument0) {

	var player_id_to_spawn = argument0;

	var player_is_already_spawned = false;

	with o_player {
		if player_id == player_id_to_spawn {
			player_is_already_spawned = true;
		}
	}

	if !player_is_already_spawned {
		var player_spawn_x = room_width*.5+random_range(-200,200);
		var player_spawn_y = room_height*.5+random_range(-200,200);
	
		with instance_create_depth(player_spawn_x, player_spawn_y, 0, o_player) {
			player_id = player_id_to_spawn;
			return id;
		}
	}
	else return noone;


}
