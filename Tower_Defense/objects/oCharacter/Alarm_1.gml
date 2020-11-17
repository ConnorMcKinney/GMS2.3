/// @description Dodging
// You can write your code in this editor
player_stats.dodging = false;
player_stats.can_take_damage = true;
player_stats.can_move = true;
sprite_index = sWalk_right;
player_stats.motion_set(0, 0);
player_stats.impulse *= .35;
alarm[2] = .25*SPEED

