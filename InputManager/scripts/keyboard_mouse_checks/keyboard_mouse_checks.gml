// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
// @function mouse_button_check(mouse_button, toggle, if toggle then current state)
function mouse_button_check(mouse_button, toggle){
	if (toggle and not (argument_count > 2)) {
		show_error("Error in mouse_button_check: \nReceived toggle == true but no current state. \nDefaulting to input_state.none", false);
		return input_state.none;
	} else if (toggle and argument_count > 2) {
		var current_state = argument[3];
		if (mouse_check_button_pressed(mouse_button)) {
			if (current_state) {
				return input_state.none;
			} else {
				return input_state.toggled;
			}
		}
	} else {
		var state = input_state.none;
		if (mouse_check_button_pressed(mouse_button)) {
			state = input_state.pressed;
			show_debug_message("Mouse clicked")
		}
		else if(mouse_check_button(mouse_button)) {
			state = input_state.held;	
		}
		else if (mouse_check_button_released(mouse_button)) {
			state = input_state.released
			show_debug_message("Mouse released")
		}
		return state;
	}
}

function keyboard_button_check(keyboard_button, toggles) {
	if (toggle and not (argument_count > 2)) {
		show_error("Error in keyboard_button_check: \nReceived toggle == true but no current state. \nDefaulting to input_state.none", false);
		return input_state.none;
	} else if (toggle and argument_count > 2) {
		var current_state = argument[3];
		if (keyboard_check_pressed(keyboard_button)) {
			if (current_state) {
				return input_state.none;
			} else {
				return input_state.toggled;
			}
		}
	} else {
		var state = input_state.none;
		if keyboard_check_pressed(keyboard_button) {
			state = input_state.pressed;	
		}
		else if keyboard_check(keyboard_button) {
			state = input_state.held;	
		}
		else if keyboard_check_released(keyboard_button) {
			state = input_state.released;	
		}
	}
	
	return state;
}