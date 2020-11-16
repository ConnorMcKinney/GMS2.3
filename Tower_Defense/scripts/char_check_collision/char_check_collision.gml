////Horizontal collisions
function char_check_collision() {
	//x += hspd;
	//var _changed_x = false;
	//var _changed_y = false;
	////Snap
	//if(!dodging && !on_wall){
	//	if place_meeting(x+sign(hspd),y,oObstacles) {
	//		var wall = instance_place(x+sign(hspd),y,oObstacles);
	//		if(script_execute(can_collide_with_tower, wall)){
	//			if hspd > 0 { //right
	//			    x = (wall.bbox_left-1)-sprite_bbox_right;
	//			} else { //left
	//			    x = (wall.bbox_right+1)-sprite_bbox_left;
	//			}
	//			hspd = 0;
	//			_changed_x = true;
	//		}
	//	}
	//}

	////vertical collisions
	//y += player_stats.vspd;

	////Snap
	//if(!dodging && !on_wall){
	//	if place_meeting(x,y+sign(player_stats.vspd),oObstacles) {
	//		var wall = instance_place(x,y+sign(player_stats.vspd),oObstacles);
	//		if(script_execute(can_collide_with_tower, wall)){
	//			if player_stats.vspd > 0 { //top
	//			    y = (wall.bbox_top-1)-sprite_bbox_bottom;
	//			} else { //bottom
	//			    y = (wall.bbox_bottom+1)-sprite_bbox_top;
	//			}
	//			player_stats.vspd = 0;
	//			_changed_y = true;
	//		}
	//	}
	//}

	//if(_changed_x && _changed_y){
	//	show_debug_message("both collided")
	//}


}
