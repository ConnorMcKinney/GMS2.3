enum player_stats{
	max_hp,
	hp,
	max_speed,
	impulse,
	restitution,
	can_move,
	on_wall,
	hspd,
	vspd,
	dodge_distance,
	dodge_speed,
	dodge_time,
	dodge_cooldown,
	can_dodge,
	dodging,
	can_take_damage,
	total
}

enum hud{
	heart_pos_x = 16,
	heart_pos_y = 16,
	heart_pos_buffer = (16+32)/2
}

global.player = object_index;
/// @description Settings and Variable init
// You can write your code in this editor
stats = ds_list_create();
stats[| player_stats.total] = 0;
//should populate in reverse index order
stats[| player_stats.max_hp] = 6
stats[| player_stats.hp] = stats[| player_stats.max_hp];
stats[| player_stats.max_speed] = 4;//8
stats[| player_stats.impulse] = .01*room_speed;//.03*room_speed
stats[| player_stats.restitution] = 0.85;

stats[| player_stats.dodge_distance] = global.gridsize * 2;
stats[| player_stats.dodge_speed] = stats[| player_stats.max_speed]*1.2;
stats[| player_stats.dodge_time] = .3*room_speed;//dodge_distance/dodge_speed
stats[| player_stats.dodge_cooldown] = 1 * room_speed;

//stats[| player_stats.can_move] = true;
//stats[| player_stats.on_wall] = false;

//stats[| player_stats.hspd] = 0;
//stats[| player_stats.vspd] = 0;

//stats[| player_stats.dodging] = false;
//stats[| player_stats.can_take_damage] = true;\



can_move = true;//stats[| player_stats.can_move];
on_wall = false;//stats[| player_stats.on_wall];

hspd = 0;//stats[| player_stats.hspd];
vspd = 0;//stats[| player_stats.vspd];

dodging = false;//stats[| player_stats.dodging];
can_dodge = true;
can_take_damage = true;//stats[| player_stats.can_take_damage];

update_player_stats();

shotgun_setup();
var exists = ds_exists(weapon, ds_type_list);
//script_execute(shotgun_setup);

update_weapon_stats();
var exists = ds_exists(weapon, ds_type_list);
//currently isn't utilized with the create_bullet script
//shot_speed_inheritance = 0
if(exists){
	show_debug_message("woot");	
}