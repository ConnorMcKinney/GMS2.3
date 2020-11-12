/// @description Dodge Roll
// You can write your code in this editor
// Should dodge enemy shots and allow the player onto towers

if(can_dodge){
	dodging = true;
	can_dodge = false;
	can_take_damage = false;
	var _axisH = keyboard_check(ord("D")) - keyboard_check(ord("A"))
	var _axisV = keyboard_check(ord("S")) - keyboard_check(ord("W"))
	var _dodge_direction = point_direction(x, y, x + _axisH, y + _axisV);
	//object_set_sprite(self.id, sCharacter_Dodge);
	sprite_index = sCharacter_Dodge
	alarm[1] = stats[player_stats.dodge_time];
	can_move = false;
	motion_set(_dodge_direction, stats[player_stats.dodge_speed]);
}
