/// @description add_upgrade(upgrade_id, name, description, sprite, type, upgrade_list);
/// @function add_upgrade
/// @param name
/// @param description
/// @param sprite
/// @param upgrade_list
/// @param consumable
function add_upgrade(argument0, argument1, argument2, argument3, argument4) {


	var upgrade_id = global.upgrade_counter;
	var name = argument0;
	var description = argument1;
	var sprite = argument2;
	var array = argument3;
	var consumable = argument4;

	global.upgrade_index[| upgrade_id] = [name, description, sprite, array, consumable];
	global.upgrade_counter ++;

	return upgrade_id;


}
