/// @description generate_random_upgrade(name, description, sprite, consumable);
/// @function generate_random_upgrade
/// @param name
/// @param description
/// @param sprite
/// @param consumable
function generate_random_upgrade(argument0, argument1, argument2, argument3) {



	var name = argument0;
	var description = argument1;
	var sprite = argument2;
	var consumable = argument3;

	var upgrade_list = array_create(upgrade_types.total, "skip");

	upgrade_list[upgrade_types.fire_rate] = irandom_range(-10, 10);
	upgrade_list[upgrade_types.projectiles] = irandom_range(-1, 2);
	upgrade_list[upgrade_types.burst_fire] = irandom_range(0, 1);
	upgrade_list[upgrade_types.projectile_spread_type] = irandom_range(0, 2);

	var iid = add_upgrade(name, description, sprite, upgrade_list, consumable);
	return iid;



}
