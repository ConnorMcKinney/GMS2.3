// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
// @function mouse_button_check(mouse_button, toggle, if toggle then current state)
function mouse_button_check(mouse_button, toggle, current_state){
	var state = input_state.none;
	if (toggle) {
		state = current_state;
		if (mouse_check_button_pressed(mouse_button)) {
			
			if (current_state == input_state.toggled) {
				show_debug_message("Mouse Toggled " + NAMES[INPUT_MOUSE_BUTTONS_INVERSE[| abs(mouse_button)]] + " Off")
				state = input_state.none;
			} else {
				show_debug_message("Mouse Toggled " + NAMES[INPUT_MOUSE_BUTTONS_INVERSE[| abs(mouse_button)]] + " On")
				state = input_state.toggled;
			}
		}
	} else {
		
		if (mouse_check_button_pressed(mouse_button)) {
			state = input_state.pressed;
			show_debug_message("Mouse clicked " + NAMES[INPUT_MOUSE_BUTTONS_INVERSE[| abs(mouse_button)]])
		}
		else if(mouse_check_button(mouse_button)) {
			state = input_state.held;	
		}
		else if (mouse_check_button_released(mouse_button)) {
			state = input_state.released
			show_debug_message("Mouse released " + NAMES[INPUT_MOUSE_BUTTONS_INVERSE[| abs(mouse_button)]])
		}
		return state;
	}
}

function keyboard_button_check(keyboard_button, toggle, current_state) {
	var state = input_state.none;
	if (toggle) {
		state = current_state;
		if (keyboard_check_pressed(keyboard_button)) {
			
			if (current_state == input_state.toggled) {
				show_debug_message("Keyboard Toggled " + NAMES[INPUT_KEYBOARD_KEYS_INVERSE[| abs(keyboard_button)]] + " Off")
				state = input_state.none;
			} else {
				show_debug_message("Keyboard Toggled " + NAMES[INPUT_KEYBOARD_KEYS_INVERSE[| abs(keyboard_button)]] + " On")
				state = input_state.toggled;
			}
		}
	} else {
		
		if keyboard_check_pressed(keyboard_button) {
			state = input_state.pressed;	
			show_debug_message("Keyboard Pressed " + NAMES[INPUT_KEYBOARD_KEYS_INVERSE[| abs(keyboard_button)]])
		}
		else if keyboard_check(keyboard_button) {
			state = input_state.held;	
		}
		else if keyboard_check_released(keyboard_button) {
			state = input_state.released;	
			show_debug_message("Keyboard Released " + NAMES[INPUT_KEYBOARD_KEYS_INVERSE[| abs(keyboard_button)]])
		}
	}
	return state;
}