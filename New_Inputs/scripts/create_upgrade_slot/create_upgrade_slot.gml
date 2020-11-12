function create_upgrade_slot() {
	for(i=0; i<global.upgrade_slots;i++){
		inst = instance_create_layer(x-8+(32*i), y-64, "Shop", upg_slot);
		inst.var_slot = global.inventory_slots+i;
	}




}
