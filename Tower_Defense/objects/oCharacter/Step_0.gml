/// @description Insert description here
// You can write your code in this editor
if(player_stats.can_move){
	//show_debug_message(this_gamepad_id);
	if (this_gamepad_id == -1) {	
	axisH = input_held(player_id_num, input_action.right)	-input_held(player_id_num, input_action.left);
	axisV = input_held(player_id_num, input_action.down)	-input_held(player_id_num, input_action.up);
	
	player_stats.last_aim_angle = darctan2(-(mouse_y-y), (mouse_x-x));

	} else {
		//MOVEMENT
		if controller_deadzone_check(INPUT_STATES[player_id_num, input_action.analogue_lx], INPUT_STATES[player_id_num, input_action.analogue_ly], DEADZONE) {
			axisH = INPUT_STATES[player_id_num, input_action.analogue_lx]//input_held(player_id, input_action.right)*INPUT_STATES[player_id, input_action.analogue_lx]
			axisV = INPUT_STATES[player_id_num, input_action.analogue_ly]//input_held(player_id, input_action.up)*INPUT_STATES[player_id, input_action.analogue_ly]
		} else {
			axisH = 0;
			axisV = 0;
		}
		//show_debug_message(string(axisH) + ", " + string(axisV));
		//show_debug_message(string(INPUT_STATES[player_id, input_action.analogue_lx]) + ", " + string(INPUT_STATES[player_id, input_action.analogue_ly]))
		
		//AIM
		if controller_deadzone_check(INPUT_STATES[player_id_num, input_action.analogue_rx], INPUT_STATES[player_id_num, input_action.analogue_ry], DEADZONE_RS) {
			player_stats.last_aim = [INPUT_STATES[player_id_num, input_action.analogue_rx], INPUT_STATES[player_id_num, input_action.analogue_ry]];
		} else if ((axisH + axisV) != 0) {
			player_stats.last_aim = [axisH, axisV];
		}
		player_stats.last_aim_angle = darctan2(-player_stats.last_aim[1], player_stats.last_aim[0]);
		
		
		//if ((INPUT_STATES[player_id_num, input_action.analogue_rx] + INPUT_STATES[player_id_num, input_action.analogue_ry]) != 0) {
		//	player_stats.last_aim = [INPUT_STATES[player_id_num, input_action.analogue_rx], INPUT_STATES[player_id_num, input_action.analogue_ry]];
		//} else if ((axisH + axisV) != 0) {
		//	player_stats.last_aim = [axisH, axisV];
		//}
		//player_stats.last_aim_angle = darctan2(-player_stats.last_aim[1], player_stats.last_aim[0]);
	}
}else{
	axisH = 0
	axisV = 0
}

if (axisH = 0)
{
	player_stats.hspd *= player_stats.restitution; //No horizontal thrust. Reduce speed.
}else{
	if (this_gamepad_id == -1) {
		player_stats.hspd += player_stats.impulse*sign(axisH);
	} else { 
		player_stats.hspd += axisH;	
	}
}

if (axisV = 0){
	player_stats.vspd *= player_stats.restitution; //No vertical thrust. Reduce speed.
}else{
	if (this_gamepad_id == -1) {
		player_stats.vspd += player_stats.impulse*sign(axisV);
	} else {
		player_stats.vspd += axisV;	
	}
}

//var _move_direction = point_direction(0, 0, hspd+stats[| player_stats.impulse]*sign(axisH), player_stats.vspd+stats[| player_stats.impulse]*sign(axisV));
var _move_direction = point_direction(0, 0, player_stats.hspd, player_stats.vspd);
//show_debug_message(clamp( sqrt( sqr(player_stats.hspd) + sqr(player_stats.vspd) )*clamp( sqrt( sqr(axisH) + sqr(axisV) ), 0, 1), 0, player_stats.max_speed));
spd = sqrt( sqr(player_stats.hspd) + sqr(player_stats.vspd) );
//show_debug_message(_move_direction)
if(spd > player_stats.max_speed){
	player_stats.hspd = player_stats.max_speed * dcos(_move_direction) * clamp( sqrt( sqr(axisH) + sqr(axisV) ), 0, 1);
	player_stats.vspd = player_stats.max_speed * dsin(_move_direction) * -1 * clamp( sqrt( sqr(axisH) + sqr(axisV) ), 0, 1);
}
if(abs(axisH)+abs(axisV) > 0){
	if(abs(player_stats.hspd) > abs(player_stats.vspd)){
		if(player_stats.hspd > 0){
			sprite_index = sWalk_right;
		}else{
			sprite_index = sWalk_left;
		}
	}else{
		if(player_stats.vspd > 0){
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

if player_stats.hspd > 0 check_right = true;
if player_stats.hspd < 0 check_left = true;
if player_stats.vspd > 0 check_bottom = true;
if player_stats.vspd < 0 check_top = true;

//show_debug_message(string(hspd) + ", " + string(player_stats.vspd));

if(!player_stats.dodging && !player_stats.on_wall){
	if (place_meeting(x + player_stats.hspd, y, oObstacles)){
		var wall = instance_place(x + player_stats.hspd, y, oObstacles);
		if(wall.player_collide){
		    while (!place_meeting(x + player_stats.hspd, y, oObstacles))
		    {
		        x += sign(player_stats.hspd);
		    }
		    player_stats.hspd = 0;
		}else{
			x += player_stats.hspd;
		}
	}else{
		x += player_stats.hspd;
	}

	if (place_meeting(x, y + player_stats.vspd, oObstacles)){
		var wall = instance_place(x, y + player_stats.vspd, oObstacles);
		if(wall.player_collide){
		    while (!place_meeting(x, y + player_stats.vspd, oObstacles)){
		        y += sign(player_stats.vspd);
		    }
		    player_stats.vspd = 0;
		}else{
			y += player_stats.vspd;
		}
	}else{
		y += player_stats.vspd
	}
	
	
}else if(!player_stats.dodging && player_stats.on_wall){
	if (!place_meeting(x + player_stats.hspd, y, oObstacles)){
		while (place_meeting(x + sign(player_stats.hspd), y, oObstacles)){
			x += sign(player_stats.hspd);
		}
		player_stats.hspd = 0;
	}else{
		x += player_stats.hspd;
	}

	if (!place_meeting(x, y + player_stats.vspd, oObstacles)){
		while (place_meeting(x, y + sign(player_stats.vspd), oObstacles)){
		    y += sign(player_stats.vspd);
		}
		player_stats.vspd = 0;
	}else{
		y += player_stats.vspd
	}
}

if(INPUT_STATES[player_id_num, input_action.dodge] == input_state.pressed){
	if(player_stats.can_dodge) {
		player_stats.dodging = true;
		player_stats.can_dodge = false;
		player_stats.can_take_damage = false;
		
		var _dodge_direction = point_direction(x, y, x + axisH, y + axisV);
		//object_set_sprite(self.id, sCharacter_Dodge);
		sprite_index = sCharacter_Dodge
		alarm[1] = player_stats.dodge_time;
		player_stats.can_move = false;
		motion_set(_dodge_direction, player_stats.dodge_speed);	
	}
}

if(INPUT_STATES[player_id_num, input_action.shoot] != input_state.none && player_stats.can_shoot){
	if(!weapon.shooting){
		weapon.shooting = true;
		alarm[0] = 1;
		
	}
}else{
	weapon.shooting = false;
	weapon.burst_count = 1;
	weapon.burst_count = 1;
	//update_weapon_stats();
}

if(!place_meeting(x,y,oObstacles)){
	player_stats.on_wall = false;	
}

if (INPUT_STATES[player_id_num, input_action.build] == input_state.pressed) {
	if (layer_get_visible("Shop")){
		layer_set_visible("Shop", false);
		instance_deactivate_layer("Shop");
		player_set_stat("all", "can_shoot", true);
	}else{
		layer_set_visible("Shop", true);
		instance_activate_layer("Shop");
		player_set_stat("all", "can_shoot", false);
	}	
}