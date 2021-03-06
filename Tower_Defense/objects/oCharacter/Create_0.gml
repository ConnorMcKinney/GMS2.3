
map = {
	gridsize : 32
};

player_stats = {
    max_hp : 6,
    hp : 6,
	
    max_speed : 4,
    impulse : 0.3*SPEED,
    restitution : 0.85,
	can_move : true,
	on_wall : false,
	hspd : 0,
	vspd : 0,
	
	dodge_distance : map.gridsize,
	//dodge_speed : max_speed*1.2,
	dodge_time : .3*SPEED,
	dodge_cooldown : 1 * SPEED,
	dodging : false,
	dodge_speed : 5,
	can_dodge : true,
	
	can_take_damage : true,	
	can_shoot : true,
	
	last_aim : [0, 0],
	last_aim_angle : 0,
	cursor_dist : 40
    };

cursor_sprite = sShooting_cursor;
window_set_cursor(cr_none)

enum hud{
	heart_pos_x = 16,
	heart_pos_y = 16,
	heart_pos_buffer = (16+32)/2
}

this_gamepad_id = -1;
player_id_num = 0;				// Set by the gameplay manager
alarm[3] = 3;

weapon = new shotgun_init();

//stats = ds_list_create();
//stats[| player_stats.total] = 0;
////should populate in reverse index order
//stats[| player_stats.max_hp] = 6
//stats[| player_stats.hp] = stats[| player_stats.max_hp];
//stats[| player_stats.max_speed] = 8;//8
//stats[| player_stats.impulse] = .03*SPEED;//.03*SPEED
//stats[| player_stats.restitution] = 0.85;

//stats[| player_stats.dodge_distance] = global.gridsize * 2;
//stats[| player_stats.dodge_speed] = stats[| player_stats.max_speed]*1.2;
//stats[| player_stats.dodge_time] = .3*SPEED;//dodge_distance/dodge_speed
//stats[| player_stats.dodge_cooldown] = 1 * SPEED;



//stats[| player_stats.can_move] = true;
//stats[| player_stats.on_wall] = false;
//stats[| player_stats.hspd] = 0;
//stats[| player_stats.vspd] = 0;

//stats[| player_stats.dodging] = false;
//stats[| player_stats.can_take_damage] = true;\



//can_move = true;//stats[| player_stats.can_move];
//on_wall = false;//stats[| player_stats.on_wall];

//hspd = 0;//stats[| player_stats.hspd];
//vspd = 0;//stats[| player_stats.vspd];

//dodging = false;//stats[| player_stats.dodging];
//can_dodge = true;
//can_take_damage = true;//stats[| player_stats.can_take_damage];

//update_player_stats();



//shotgun_setup();


/*if(can_dodge){
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
*/