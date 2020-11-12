/// @description read_upgrade(item);
/// @function read_upgrade
/// @param item_id
function read_upgrade_array(argument0) {

	var iid = argument0;
	var upgrade = global.upgrade_index[| iid];
	var array = upgrade[upgrade_index_values.array];

	return array;




}
