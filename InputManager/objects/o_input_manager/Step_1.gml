/* Welcome to the input manager, where the magic happens!

This object has two jobs:

1. To decide which device controls which player, and
2. To standardize all the inputs in a way that is easy to read.

Notice that this object is Persistent (the checkbox to the left, under "Visible").
This means the object can be created once at the start of the game, and it will live forever,
even between rooms.

Also notice that we are handling all of the inputs in the Begin Step event. This way, we can figure
out our input situation before we get to other things, like the normal Step event.

So, now it's on to the first job of the Input Manager: Assigning input devices to players!

First, we need to know how many gamepads we should be checking. */

var max_gamepad_slot = gamepad_get_device_count();
// Next, we'll check each gamepad and watch for buttons to be pressed.

for ( var gamepad_id = 0; gamepad_id < max_gamepad_slot; gamepad_id++){
	if gamepad_is_connected(gamepad_id) {
		/* When the player presses Start, "A", any of the Dpad buttons, or wiggles the joystick,
		we will assign the gamepad to a player, unless that gamepad is already in use. */
		
		if	gamepad_button_check_pressed(gamepad_id, gp_start) ||
			gamepad_button_check_pressed(gamepad_id, gp_face1) ||
			gamepad_button_check_pressed(gamepad_id, gp_padu) ||
			gamepad_button_check_pressed(gamepad_id, gp_padd) ||
			gamepad_button_check_pressed(gamepad_id, gp_padr) ||
			gamepad_button_check_pressed(gamepad_id, gp_padl) ||
			abs(gamepad_axis_value(gamepad_id, gp_axislh)) > .5 ||
			abs(gamepad_axis_value(gamepad_id, gp_axislv)) > .5 {
				
			var this_gamepad_player_id		= ds_list_find_index(PLAYER_GAMEPAD_IDS, gamepad_id);
			var gamepad_is_already_in_use	= (this_gamepad_player_id >= 0);
			
			if (!gamepad_is_already_in_use) {
				/* This gamepad hasn't been assigned to any players yet, so we want to assign it now
				because it has been activated! */
				
				var first_player_is_using_keyboard = (ds_list_find_value(PLAYER_GAMEPAD_IDS, 0) == -1);
				
				//if first_player_is_using_keyboard {
				//	/* We will also check whether the first player is using a keyboard.
				//	If they are, we will swap them to the gamepad, allowing player 1
				//	to seamlessly switch between keyboard and controller. */
					
				//	ds_list_replace(PLAYER_GAMEPAD_IDS, 0, gamepad_id);
				//}
				//else 
				if ds_list_size(PLAYER_GAMEPAD_IDS) < MAX_PLAYERS {
					/* This is a whole new player, so we'll add this gamepad to the list. */
					
					ds_list_add(PLAYER_GAMEPAD_IDS, gamepad_id); 
				}
			}
		}
	}
}

/* We also need to check for *disconnected* gamepads. So let's do that!

We'll allow the "Select" or "Back" button to disconnect the gamepad, or if the gamepad gets turned off or unplugged.

If it turns out that we've lost a gamepad, we will need to delete it from the list. So we want to
start at the end of the list and iterate down to zero, so deleting stuff doesn't mess up our counts. */

for ( var player_id = ds_list_size(PLAYER_GAMEPAD_IDS)-1; player_id >= 0; player_id--){
	var this_player_gamepad_id = PLAYER_GAMEPAD_IDS[|player_id];
	if (this_player_gamepad_id >= 0) {
		if !gamepad_is_connected(this_player_gamepad_id) || gamepad_button_check_pressed(this_player_gamepad_id, gp_select) {
			
			// Then we will remove this gamepad from our list by deleting the current player slot.
			ds_list_delete(PLAYER_GAMEPAD_IDS, player_id);
		}
	}
}

/* But there's one caveat! If we end up with nothing in the list, that means we have no players,
which is a bad situation. In that case, we should add -1 back in to the list, so player 1
is back to using a keyboard. */

if ds_list_empty(PLAYER_GAMEPAD_IDS) {
	ds_list_add(PLAYER_GAMEPAD_IDS, -1);
}

/* And last, if player 1 presses a keyboard button, we want to switch them back to keyboard mode
by simply ensuring that the first player's gamepad ID is -1. */
if keyboard_check_pressed(vk_anykey) {
	ds_list_replace(PLAYER_GAMEPAD_IDS, 0, -1);	
}

/* Our input manager is now connecting and disconnecting controllers and keyboards dynamically.

Next, we're going check our connected devices, read their inputs, and funnel all their inputs
into the same system. Later, that system will be read by the player! */

for ( var player_id = 0; player_id < ds_list_size(PLAYER_GAMEPAD_IDS); player_id++){
	
	/* For this player, we're going to iterate through our various input actions
	and check the state of that button. Then, we'll update our INPUT_STATES array with the result. */
	
	var this_gamepad_id = ds_list_find_value(PLAYER_GAMEPAD_IDS, player_id);
	
	for ( var this_input_action = 0; this_input_action < array_length_1d(INPUT_STATES[0]); this_input_action++){
		if this_gamepad_id != -1 {
			/* In this case, we have a gamepad connected. Let's check the button for this input action! */
			
			var this_input_button = INPUT_GAMEPAD_KEYS[this_input_action];
			if (this_input_button != noone) {
				
				if (this_input_button == gp_axislh or this_input_button == gp_axislv or this_input_button == gp_axisrh or this_input_button == gp_axisrv) {
					if (abs(gamepad_axis_value(this_gamepad_id, this_input_button))-DEADZONE > 0) {
						
						//INPUT_STATES[player_id, this_input_action] = input_state.held;
						INPUT_STATES[player_id, this_input_action] = gamepad_axis_value(this_gamepad_id, this_input_button);
					} else {
						//INPUT_STATES[player_id, this_input_action] = input_state.none;
						INPUT_STATES[player_id, this_input_action] = 0;
					}
				}
				else if gamepad_button_check_pressed(this_gamepad_id, this_input_button) {
					INPUT_STATES[player_id, this_input_action] = input_state.pressed;	
				}
				else if gamepad_button_check(this_gamepad_id, this_input_button) {
					INPUT_STATES[player_id, this_input_action] = input_state.held;	
				}
				else if gamepad_button_check_released(this_gamepad_id, this_input_button) {
					INPUT_STATES[player_id, this_input_action] = input_state.released;	
				}
				else INPUT_STATES[player_id, this_input_action] = input_state.none;
			
				/* We have updated the state of this input action for this player in our INPUT_STATES array. */
			}
		}
		else {
			/* In this case, we have a keyboard connected. Let's check the keyboard for this input action! */
			
			var this_keyboard_button = INPUT_KEYBOARD_KEYS[this_input_action];
			if (this_keyboard_button != noone) {
			
				if (this_keyboard_button == mb_left or this_keyboard_button == mb_right) {
					if (mouse_check_button_pressed(this_keyboard_button)) {
						INPUT_STATES[player_id, this_input_action] = input_state.pressed;
					}
					else if(mouse_check_button(this_keyboard_button)) {
						INPUT_STATES[player_id, this_input_action] = input_state.held;	
					}
					else if (mouse_check_button_released(this_keyboard_button)) {
						INPUT_STATES[player_id, this_input_action] = input_state.released	
					}
					else INPUT_STATES[player_id, this_input_action] = input_state.none;
				}
				if keyboard_check_pressed(this_keyboard_button) {
					INPUT_STATES[player_id, this_input_action] = input_state.pressed;	
				}
				else if keyboard_check(this_keyboard_button) {
					INPUT_STATES[player_id, this_input_action] = input_state.held;	
				}
				else if keyboard_check_released(this_keyboard_button) {
					INPUT_STATES[player_id, this_input_action] = input_state.released;	
				}
				else INPUT_STATES[player_id, this_input_action] = input_state.none;
			
				//if (toggles[this_input_action] == true) {
				//	if (INPUT_STATES[player_id, this_input_action] == input_state.pressed) {
				//	}
				//}
				/* We have updated the state of this input action for this player in our INPUT_STATES array. */
			}
		}
	}
}

/* Now we're done processing inputs! To recap, what we did in this object was:
	1. Connect and disconnect devices, allowing for multiple players and different control devices (keyboard or controller).
	2. Read the button presses for each input_action from each player's device
	3. Write those input action states for each player into our standardized INPUT_STATES array.
	
Now that we have our input states stored conveniently, we can create a few convenience scripts so that other
objects can easily read these inputs. To do this, I have made the following scripts, which you can pop open and inspect:

	input_pressed()		-- If a player has pressed a certain input action, this will return true. Otherwise, false.
	input_held()		-- If a player is holding a certain input action, this will return true. Otherwise, false.
	input_released()	-- If a player has released a certain input action, this will return true. Otherwise, false.
	
Now, let's put these scripts into action! I've created a simple player object that just moves around, using our input_actions.
Let's take a look at the object called o_player, and jump into its Create event! */
	