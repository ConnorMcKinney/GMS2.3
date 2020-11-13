/// @description Draw the mouse items.
var iid = global.mouse_slot[# 0, 0];
var amount = global.mouse_slot[# 0, 1];
var list_to_check = global.mouse_slot[# 0, 2];

//show_debug_message(0 == item.none);
//show_debug_message(0 == iid);
//show_debug_message(item.none == iid);
////show_debug_message(typeof(item.none));
////show_debug_message(typeof(iid));

////show_debug_message(global.item_index);
////show_debug_message(global.upgrade_index);
//show_debug_message("----");

if(iid != item.none){
	if(list_to_check == global.item_index){
		var name = global.item_index[# iid, item_stat.name];
		var description = global.item_index[# iid, item_stat.description];
		draw_sprite(sItem_sprite_sheet, iid, mouse_x-16, mouse_y-16); //Draw item sprite
	}else if(list_to_check == global.upgrade_index){
		var name = global.upgrade_index[| iid];
		name = name[upgrade_index_values.name];
		var description = global.upgrade_index[| iid];
		description = description[upgrade_index_values.description];
		var sprite = global.upgrade_index[| iid];
		sprite = sprite[upgrade_index_values.sprite];
	
		draw_sprite(sprite, 0, mouse_x-16, mouse_y-16); //Draw item sprite
	}else{
		show_message("idk");	
	}
	draw_text(mouse_x-16+4, mouse_y+4-16, string(amount)); //Draw item quantity	
}
draw_bbox();