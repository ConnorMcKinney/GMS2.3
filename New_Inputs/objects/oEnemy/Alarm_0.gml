/// @description Insert description here
// You can write your code in this editor

var _character = instance_nearest(x, y, oCharacter)
if(_character){
	create_bullet(oEnemyBullet, _character.x, _character.y, 0)
}

