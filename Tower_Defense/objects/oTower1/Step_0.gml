/// @description Dragging
// You can write your code in this editor

if(dragging){
	//x = mouse_x;
	//y = mouse_y;
	
	//var xx = bbox_left / global.gridsize;
	//var yy = bbox_top / global.gridsize;

	//xx = floor(xx + 0.5);
	//yy = floor(yy + 0.5);

	//xx *= global.gridsize;
	//yy *= global.gridsize;

	//x = xx + (x - bbox_left);
	//y = yy + (y - bbox_top);
	//if(place_meeting(x, y, oRegion) or place_meeting(x, y, oTowerParent)){
	//	color = c_red;
	//}else{
	//	color = c_white;
	//}
	script_execute(snap_target);
	collision.x = x;
	collision.y = y;
	depth = -bbox_bottom;
	if(instance_place(x, y + global.gridsize, oTower1)){
		sprite_index = sTower1_join;	
	}else{
		sprite_index = sTower1;	
	}
}
//show_debug_message("Tower depth: " + string(depth));
