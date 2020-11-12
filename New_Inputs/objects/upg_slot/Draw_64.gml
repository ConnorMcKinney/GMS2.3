/// @description Insert description here
// You can write your code in this editor
var iid = global.inventory[# var_slot, 0];
var amount = global.inventory[# var_slot, 1];
var name = global.item_index[# iid, item_stat.name];
var description = global.item_index[# iid, item_stat.description];

//Draw stuff

draw_sprite(sItem_sprite_sheet, iid, x, y); //Draw item sprite
if(!iid == item.none){
	draw_text(x+4, y+4, string(amount)); //Draw item quantity
	draw_text(x-global.gridsize/2, y-global.gridsize*1.5, name);
}
draw_bbox();