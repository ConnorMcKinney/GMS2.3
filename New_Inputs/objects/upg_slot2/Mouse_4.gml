/// @description Insert description here
// You can write your code in this editor
var iid = global.inventory[# var_slot, 0];
var amount = global.inventory[# var_slot, 1];
var mouse_iid = global.mouse_slot[# 0, 0];
var mouse_amount = global.mouse_slot[# 0, 1];

if (iid == 0 || mouse_iid == 0 || iid != mouse_iid) //If either slot is empty, or the two slots don't match
{
//Switch the slots
global.inventory[# var_slot, 0] = mouse_iid;
global.inventory[# var_slot, 1] = mouse_amount;
global.mouse_slot[# 0, 0] = iid;
global.mouse_slot[# 0, 1] = amount;
//random_player_upgrade();
}
else if (iid == mouse_iid) //If both slots are the same
{
//Take all mouse items and put them in inventory
global.inventory[# var_slot, 1] += global.mouse_slot[# 0, 1];
global.mouse_slot[# 0, 0] = item.none;
global.mouse_slot[# 0, 1] = 0;
}