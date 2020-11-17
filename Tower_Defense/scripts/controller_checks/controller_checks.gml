// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function controller_axis_check(controller_id, axis) {
	var state = 0;
	var axis_val = gamepad_axis_value(controller_id, axis);
	if (axis == gp_axislh or axis == gp_axislv) {
		if (abs(axis_val)-DEADZONE > 0) {
				//results[0] = true
				state = gamepad_axis_value(controller_id, axis);
		}
	} else { 
		if (abs(axis_val)-DEADZONE > .2) {
				//results[0] = true
				state = gamepad_axis_value(controller_id, axis);
		}	
	}
	
	return state;	
}

function controller_button_check(controller_id, button, toggle, current_state) {
	var state = input_state.none;
	if (toggle) {
		state = current_state;
		if (gamepad_button_check_pressed(controller_id, button)) {
			
			if (current_state == input_state.toggled) {
				show_debug_message("Controller Toggled " + NAMES[INPUT_GAMEPAD_KEYS_INVERSE[| abs(button)]] + " Off");
				state = input_state.none;
			} else {
				show_debug_message("Controller Toggled " + NAMES[INPUT_GAMEPAD_KEYS_INVERSE[| abs(button)]] +  " On");
				state = input_state.toggled;
			}
		}
	} else {
		if gamepad_button_check_pressed(controller_id, button) {
			state = input_state.pressed;
			show_debug_message("Controller Pressed " + NAMES[INPUT_GAMEPAD_KEYS_INVERSE[| abs(button)]])
		} else if gamepad_button_check(controller_id, button) {
			state = input_state.held;	
		}
		else if gamepad_button_check_released(controller_id, button) {
			state = input_state.released;	
			show_debug_message("Controller Released " + NAMES[INPUT_GAMEPAD_KEYS_INVERSE[| abs(button)]])
		}
	}
	
	return state;		
}