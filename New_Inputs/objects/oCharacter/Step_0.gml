/// @description Insert description here
// You can write your code in this editor
if(can_move){
	axisH = keyboard_check(ord("D")) - keyboard_check(ord("A"))
	axisV = keyboard_check(ord("S")) - keyboard_check(ord("W"))
}else{
	axisH = 0
	axisV = 0
}

if (axisH = 0)
{
	    hspd *= stats[| player_stats.restitution]; //No horizontal thrust. Reduce speed.
}else{
	    hspd += stats[| player_stats.impulse]*sign(axisH);
}

if (axisV = 0){
	    vspd *= stats[| player_stats.restitution]; //No vertical thrust. Reduce speed.
}else{
	    vspd += stats[| player_stats.impulse]*sign(axisV);
}

var _move_direction = point_direction(0, 0, hspd+stats[| player_stats.impulse]*sign(axisH), vspd+stats[| player_stats.impulse]*sign(axisV))
spd = sqrt(sqr(hspd)+sqr(vspd))
if(spd > stats[| player_stats.max_speed]){
	hspd = stats[| player_stats.max_speed] * dcos(_move_direction)
	vspd = stats[| player_stats.max_speed] * dsin(_move_direction) * -1
}
if(abs(axisH)+abs(axisV) > 0){
	if(abs(hspd) > abs(vspd)){
		if(hspd > 0){
			sprite_index = sWalk_right;
		}else{
			sprite_index = sWalk_left;
		}
	}else{
		if(vspd > 0){
			sprite_index = sWalk_down;
		}else{
			sprite_index = sWalk_up;
		}
	}
end
//bbox variables

//var sprite_bbox_top = sprite_get_bbox_top(sprite_index) - sprite_get_yoffset(sprite_index);
//var sprite_bbox_left = sprite_get_bbox_left(sprite_index) - sprite_get_xoffset(sprite_index);
//var sprite_bbox_right = sprite_get_bbox_right(sprite_index) - sprite_get_xoffset(sprite_index);
//var sprite_bbox_bottom = sprite_get_bbox_bottom(sprite_index) - sprite_get_yoffset(sprite_index);

//show_debug_message("Top: " + string(sprite_bbox_top));
//show_debug_message("Left: " + string(sprite_bbox_left));
//show_debug_message("Right: " + string(sprite_bbox_right));
//show_debug_message("Bottom: " + string(sprite_bbox_bottom));

bbox_centerx= bbox_right-(bbox_right - bbox_left)/2;
bbox_centery = bbox_bottom-(bbox_bottom - bbox_top)/2;

var check_left = false;
var check_right = false;
var check_top = false;
var check_bottom = false;

if hspd > 0 check_right = true;
if hspd < 0 check_left = true;
if vspd > 0 check_bottom = true;
if vspd < 0 check_top = true;

//show_debug_message(string(hspd) + ", " + string(vspd));

if(!dodging && !on_wall){
	if (place_meeting(x + hspd, y, oObstacles)){
		var wall = instance_place(x + hspd, y, oObstacles);
		if(wall.player_collide){
		    while (!place_meeting(x + hspd, y, oObstacles))
		    {
		        x += sign(hspd);
		    }
		    hspd = 0;
		}else{
			x += hspd;
		}
	}else{
		x += hspd;
	}

	if (place_meeting(x, y + vspd, oObstacles)){
		var wall = instance_place(x, y + vspd, oObstacles);
		if(wall.player_collide){
		    while (!place_meeting(x, y + vspd, oObstacles)){
		        y += sign(vspd);
		    }
		    vspd = 0;
		}else{
			y += vspd;
		}
	}else{
		y += vspd
	}
	
	
}else if(!dodging && on_wall){
	if (!place_meeting(x + hspd, y, oObstacles)){
		while (place_meeting(x + sign(hspd), y, oObstacles)){
			x += sign(hspd);
		}
		hspd = 0;
	}else{
		x += hspd;
	}

	if (!place_meeting(x, y + vspd, oObstacles)){
		while (place_meeting(x, y + sign(vspd), oObstacles)){
		    y += sign(vspd);
		}
		vspd = 0;
	}else{
		y += vspd
	}
}

depth = -bbox_bottom

//show_debug_message("Player depth: " + string(depth));

if(mouse_check_button(mb_left) && script_execute(can_shoot)){
	if(!weapon[| weapon_stats.shooting]){
		weapon[| weapon_stats.shooting] = true;
		alarm[0] = 1;
		
	}
}else{
	weapon[| weapon_stats.shooting] = false;
	weapon[| weapon_stats.burst_count] = 1;
	burst_count = 1;
	//update_weapon_stats();
}

if(!place_meeting(x,y,oObstacles)){
	on_wall = false;	
}
