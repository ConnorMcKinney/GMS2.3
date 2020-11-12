/// @description Insert description here
// You can write your code in this editor
if (layer_get_visible("Shop")){
	layer_set_visible("Shop", false);
	instance_deactivate_layer("Shop");
}else{
	layer_set_visible("Shop", true);
	instance_activate_layer("Shop");
}