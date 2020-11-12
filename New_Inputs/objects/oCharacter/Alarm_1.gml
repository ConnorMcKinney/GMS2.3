/// @description Dodging
// You can write your code in this editor
dodging = false;
can_take_damage = true;
can_move = true;
//sprite_index = sCharacter;
motion_set(0, 0);
stats[player_stats.impulse] *= .35;
alarm[2] = .25*room_speed

if(place_meeting(x, y, oObstacles)){
	on_wall = true;
}
