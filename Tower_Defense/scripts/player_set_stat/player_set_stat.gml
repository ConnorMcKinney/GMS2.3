// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function player_set_stat(player, stat, value){
	if (player == "all") {
		//for(i=0; i<ds_list_size(PLAYER_GAMEPAD_IDS); i++) {
				
		//}
		with(oCharacter) {
			if (variable_struct_exists(player_stats, stat)) {
				variable_struct_set(player_stats, stat, value);	
			}
		}
	} else {
		with(oCharacter) {
			if (player_id_num == player) {
				if (variable_struct_exists(player_stats, stat)) {
					variable_struct_set(player_stats, stat, value);	
				}
			}
		}
	}
}