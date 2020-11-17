function can_shoot_check(_player_stats) {
	if(layer_get_visible("Shop")){
		return false	
	}else{
		return true	
	}
}
