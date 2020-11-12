/// @description Shooting
// You can write your code in this editor

if(instance_exists(objectToShoot)){
	script_execute(create_bullet, oBullet, objectToShoot.x, objectToShoot.y, 0);
}else{
	shooting = false;
	burst_count = 0;
}
