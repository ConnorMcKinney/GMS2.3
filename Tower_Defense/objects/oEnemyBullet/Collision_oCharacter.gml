/// @description Insert description here
// You can write your code in this editor

//pierce_check()
if(other.can_take_damage){
	instance_destroy();
	//show_debug_message("hit character")
	other.stats[| player_stats.hp] -= 1;
}

