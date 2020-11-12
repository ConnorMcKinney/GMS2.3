/// @description Insert description here
// You can write your code in this editor
var iid = global.inventory[# var_slot, 0];
var amount = global.inventory[# var_slot, 1];
var list_to_check = global.inventory[# var_slot, 2];


if(list_to_check == global.item_index){
	var name = global.item_index[# iid, item_stat.name];
	var description = global.item_index[# iid, item_stat.description];
	draw_sprite(sItem_sprite_sheet, iid, x, y);
}else if(list_to_check == global.upgrade_index){
	var name = global.upgrade_index[| iid];
	name = name[upgrade_index_values.name];
	var description = global.upgrade_index[| iid];
	description = description[upgrade_index_values.description];
	var sprite = global.upgrade_index[| iid];
	sprite = sprite[upgrade_index_values.sprite];
	
	draw_sprite(sprite, 0, x, y); //Draw item sprite
}

//Draw stuff

if(!iid == item.none){
	draw_text(x+4, y+4, string(amount)); //Draw item quantity
	draw_text(x-global.gridsize/2, y-global.gridsize*1.5, name);
}
draw_bbox();