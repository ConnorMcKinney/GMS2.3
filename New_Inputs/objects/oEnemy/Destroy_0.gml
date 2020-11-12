/// @description Insert description here
// You can write your code in this editor
global.coins += money;

var r = irandom_range(2,4);
for(var i = 0; i < r; i++){
	blood = instance_create_layer(x + random_range(-8,8), y + random_range(-8,8), "BelowInstances", obj_blood);
	// Make the Blood Colorful
	with(blood){
		image_blend = make_colour_hsv(255, 255, random(255));
		//other.color;
	}
}