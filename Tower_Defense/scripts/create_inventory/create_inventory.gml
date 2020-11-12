function create_inventory() {
	var slot = 0;
	while (slot < global.inventory_slots){
	var inst = instance_create_layer(x+8+(64*slot), y+8, "Shop", obj_slot);
	inst.var_slot = slot;
	slot ++;
	}



}
