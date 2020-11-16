/// @arg player_id_to_despawn
function despawn_player(argument0) {

	var player_id_to_despawn = argument0;

	with oCharacter {
		if player_id_num == player_id_to_despawn {
			instance_destroy();
			show_debug_message("Despawned player.");
		}
	}
}
