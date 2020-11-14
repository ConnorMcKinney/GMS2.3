/// @description 
/// @param
this_gamepad_id = ds_list_find_value(PLAYER_GAMEPAD_IDS, player_id_num)
if (this_gamepad_id == -1) {
	keyboard = true;	
} else {
	keyboard = false;
}