var iid = global.inventory[# var_slot, 0];
var amount = global.inventory[# var_slot, 1];
var list_to_check = global.inventory[# var_slot, 2];
var mouse_iid = global.mouse_slot[# 0, 0];
var mouse_amount = global.mouse_slot[# 0, 1];
var m_list_to_check = global.mouse_slot[# 0, 2];

if (iid == 0 or mouse_iid == 0 or iid != mouse_iid or list_to_check != m_list_to_check) //If either slot is empty, or the two slots don't match
{
//Switch the slots
global.inventory[# var_slot, 0] = mouse_iid;
global.inventory[# var_slot, 1] = mouse_amount;
global.inventory[# var_slot, 2] = m_list_to_check;
global.mouse_slot[# 0, 0] = iid;
global.mouse_slot[# 0, 1] = amount;
global.mouse_slot[# 0, 2] = list_to_check;
}
else if (iid == mouse_iid) //If both slots are the same
{
//Take all mouse items and put them in inventory
global.inventory[# var_slot, 1] += global.mouse_slot[# 0, 1];
global.mouse_slot[# 0, 0] = item.none;
global.mouse_slot[# 0, 1] = 0;
global.mouse_slot[# 0, 2] = "empty";
}