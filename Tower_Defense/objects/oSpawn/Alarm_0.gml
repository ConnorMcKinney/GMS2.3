/// @description Insert description here
// You can write your code in this editor

if(global.level mod 3 != 0){
	if(spawn_count < spawn_amount){
		instance_create_depth(x, y, -1, oEnemy);
		spawn_count++;
		alarm[0] = spawn_rate
	}
}else{
	//Spawning a boss
	var _boss = instance_create_depth(x, y, -1, oEnemy);
	_boss.hp *= 10;
	_boss.speed *= .66;
	_boss.sprite_index = sBoss;
	show_debug_message("spawn");
}