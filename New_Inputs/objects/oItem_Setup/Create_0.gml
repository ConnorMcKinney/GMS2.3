/// @description Insert description here
// You can write your code in this editor

enum item{
none,
tower_base,
upgrade,
rocket,
rifle,
total
}

enum upgrade_index_values{
	name,
	description,
	sprite,
	array,
	consumable,
	total
}


enum item_stat{
name,
description,
sprite,
type,
list,
total
}



enum item_type{
none,
weapon,
upgrade,
useable,
total
}

enum weapon_stats{
	damage,
	fire_rate,
	can_pierce,
	pierce_max,
	projectiles,
	projectile_speed,
	projectile_spread_type, //0=linear, 1=equal spacing, 2=randomspread
	projectile_spread_value, //bounding cone. Included angle
	upgrade_max,

	automatic,
	burst_fire,
	burst_delay,
	burst_amount,
	
	explode,
	fire,
	water,
	ice,
	acid,
	electric,
	laser,
	//
	shooting,
	have_pierced,
	burst_count,
	upgrades,
	
	total
}

enum upgrade_types{
	damage,
	fire_rate,
	can_pierce,
	pierce_max,
	projectiles,
	projectile_speed,
	projectile_spread_type, //0=linear, 1=equal spacing, 2=randomspread
	projectile_spread_value, //bounding cone. Included angle
	upgrade_max,

	automatic,
	burst_fire,
	burst_delay,
	burst_amount,
	
	explode,
	fire,
	water,
	ice,
	acid,
	electric,
	laser,
	
	total
}


names = ["damage","fire_rate","can_pierce","pierce_max","projectiles","projectile_speed",
		"projectile_spread_type","projectile_spread_value","upgrade_max","automatic","burst_fire","burst_delay",
		"burst_amount","explode","fire","water","ice","acid","electric","laser","total"]
global.upgrade_names = ds_list_create();
for(i=0; i<array_length_1d(names);i++){
	global.upgrade_names[| i] = names[i]
	//show_debug_message(names[i]);
}
names = [];


//global.upgrade_stats_map = ds_map_create();
//ds_grid_clear(global.upgrade_stats_map, 0);
	

global.item_index = ds_grid_create(item.total, item_stat.total);
ds_grid_clear(global.item_index, 0); //Set every position to 0

global.upgrade_index = ds_list_create();

//global.item_index = []
//global.item_index[12] = 0

//add_weapon(item.none, "", "", 0);
//add_weapon(item.rifle, "'Tis a gun.", "A sword to banish evil!",  3);
//add_weapon(item.rocket, "ROcket LaUNcHER", "A magic staff, pulsing with power.", 5);


//add_food(item.upgrade, "Upgrade", "Pretty basic. In every RPG.",  10);
//add_food(item.tower_base, "Tower base", "It's red. Like normal.", 25);

//add_weapon(item.none, "Empty", "3empty5me", 0);



global.upgrade_counter = 1;
//add_upgrade(1, "Upgrade", "It's an upgrade", sUpgrade, item_type.upgrade, blank_upgrade_list);
//player_health += global.item_index[# item.apple, item_stat.health_gain]; //Gain health from eating an apple.

//if (global.item_index[# equipped_item, item_stat.type] == item_type.weapon)
//{
//enemy_health -= global.item_index[# equipped_item, item_stat.damage]; //Attack an enemy with any weapon
//}

global.inventory_slots = 10;
global.inventory_depth = 3;
global.upgrade_slots = 1;
global.inventory = ds_grid_create(global.inventory_slots+global.upgrade_slots, global.inventory_depth);
ds_grid_clear(global.inventory, 0);

//for(var i = 0; i< global.inventory_depth; i++){
//	global.inventory[# 5, 0] = item.none;	
//}

global.mouse_slot = ds_grid_create(1, 3); //id, amount, index to check
ds_grid_clear(global.mouse_slot, 0);
//gain_item(item.tower_base, 50);
//gain_item(item.upgrade, 1);
//global.inventory[# 5, 0] = item.rocket;
//slot_modify_amount(5, 2, true);

//global.inventory[# 3, 0] = item.rocket;
//slot_modify_amount(3, 4, true);
create_inventory();


