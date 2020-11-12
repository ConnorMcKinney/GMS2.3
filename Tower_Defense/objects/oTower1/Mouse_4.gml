/// @description Placement and Selection
// You can write your code in this editor
if(dragging){
	if(color == c_white){
		//instance_destroy();
		//instance_create_depth(mouse_x, mouse_y, -1, oTower1);
		dragging = false;
		placed = true;
	}
}else if(placed){
	global.selected = self;
}else if(in_shop){
	//if(global.coins >= cost){
	//	global.coins -= cost;
	//	var new_tower = instance_copy(true); //instance_create_depth(mouse_x,mouse_y, -1, oTower1);
	//	new_tower.in_shop = false;
	//	new_tower.dragging = true;
	//	new_tower.layer = layer_get_id("Instances");
	//}	
	var slot = 0; //A temporary variable to loop through the slots
	var inventory_width = ds_grid_width(global.inventory);

	while (slot < inventory_width){
	    //Searching for a matching inventory slot
	    if (global.inventory[# slot, 0] == item.tower_base){
			if(global.inventory[# slot, 1] > 0){
				global.inventory[# slot, 1] -= 1;
			
				var new_tower = instance_copy(true); //instance_create_depth(mouse_x,mouse_y, -1, oTower1);
				new_tower.in_shop = false;
				new_tower.dragging = true;
				new_tower.layer = layer_get_id("Instances");
		        break; //Exit function, because it has set the slot
			}
	    }
	    slot ++; //Increment slot to test next position
	}
}