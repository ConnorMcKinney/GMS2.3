/// @description add_useable(item_ID, name, description, damage);
/// @function add_weapon
/// @param item_ID
/// @param name
/// @param description
/// @param sprite
/// @param type
/// @param extra
function add_useable(argument0, argument1, argument2, argument3, argument4, argument5) {


	var iid = argument0;
	global.item_index[# iid, item_stat.name] = argument1;
	global.item_index[# iid, item_stat.description] = argument2;
	global.item_index[# iid, item_stat.sprite] = argument3;
	global.item_index[# iid, item_stat.type] = argument4;
	global.item_index[# iid, item_stat.list] = argument5; 



	show_debug_message(global.item_index);
	//return 


}
