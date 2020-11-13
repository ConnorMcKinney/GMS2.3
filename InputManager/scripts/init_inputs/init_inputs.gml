function init_inputs() {
	/* This is where we set up the DATA STRUCTURES for handling all of our inputs.

	First, we're going to set up a bunch of "Input Actions." These actions are going to be tied
	to different key presses and whatnot later on. This is how we standardize our input system.
	To keep this project simple, we're just going to have a character that moves up, down, left, and right.

	We'll set up our Input Actions as an enumerator, because enumerators are easy to work with, and it will
	automatically assign the ID numbers of each of the input actions. To learn more about enumerators,
	you can just middle-click the word 'enum' below. */

	enum input_action { up, down, left,	right, shoot, dodge, build, menu, inventory, controls , analogue_lx, analogue_ly, analogue_rx, analogue_ry};
	enum toggles { false, false, false, false, false, false, true,  true, true,		 true, false, false, false, false}

	/* Next, we're going to initialize a few different input *states* in the same way.

	We'll then be able to connect these inputs states to different input actions for different players.

	For example, we will be able to know that Player 1 is holding the "Left" input, while
	player 2 just released the "Up" input. But more on that later! For now, we'll just initialize.*/

	enum input_state { none, pressed, held,	released, toggled };

	// Now we'll set up some global variables to store all of our different bits of information.

	globalvar MAX_PLAYERS;			MAX_PLAYERS			= 4;	// This is a variable that lets us set the maximum number of players we want to handle.
	globalvar INPUT_STATES;			INPUT_STATES		= 0;	// This will be a 2D array that holds the state of each input action for each player.
	globalvar INPUT_KEYBOARD_KEYS;	INPUT_KEYBOARD_KEYS	= 0;	// This will be a 1D array that holds the keyboard hotkey assignments for each input action.
	globalvar INPUT_GAMEPAD_KEYS;	INPUT_GAMEPAD_KEYS	= 0;	// This will be a 1D array that holds the gamepad hotkey assignments for each input action.
	//globalvar INPUT_MOUSE_BUTTONS; INPUT_MOUSE_BUTTONS = 0;		// 1D array that holds mouse button assignments

	// Next, we'll create a list that will let us store the control method assigned to each player.
	globalvar PLAYER_GAMEPAD_IDS;		PLAYER_GAMEPAD_IDS	= ds_list_create(); 

	ds_list_add(PLAYER_GAMEPAD_IDS, -1);

	/* Each position in the PLAYER_GAMEPAD_IDS list corresponds to a unique player.

	We use a gamepad ID of -1 to represent that the player is not using a gamepad, but is instead using a keyboard.
	We've started by adding a -1 to the list, so that the first player is initialized as using the keyboard.

	Next, we'll run a custom script called input_create() to initialize our different inputs. Go ahead
	and pop open the input_create() script to see what it does! */
	
	/*	http://docs.yoyogames.com/source/dadiospice/002_reference/mouse,%20keyboard%20and%20other%20controls/keyboard%20input/
		https://docs.yoyogames.com/source/dadiospice/002_reference/mouse,%20keyboard%20and%20other%20controls/gamepad%20input/index.html
		https://docs.yoyogames.com/source/dadiospice/002_reference/mouse,%20keyboard%20and%20other%20controls/mouse%20input/index.html
	*/
		
	
	//up, down, left,	right, shoot, dodge, build, menu, inventory, controls
	//order is keyboard, gamepad, mouse, toggle
	input_create(input_action.up,		ord("W"), noone, noone);
	input_create(input_action.down,		ord("S"), noone, noone);
	input_create(input_action.left,		ord("A"), noone, noone);
	input_create(input_action.right,	ord("D"), noone, noone);
	input_create(input_action.shoot,	vk_space, gp_shoulderr, mb_left);
	input_create(input_action.dodge,	noone, 	gp_face1, mb_right);
	input_create(input_action.build,	ord("B"), 	gp_padu, noone);
	input_create(input_action.menu,		vk_escape, gp_start, noone);
	input_create(input_action.inventory, ord("I"), 	gp_face3, noone);
	input_create(input_action.controls,	vk_f1, noone, noone);
	input_create(input_action.analogue_lx,	noone, gp_axislh, noone);
	input_create(input_action.analogue_ly,	noone, gp_axislv, noone);
	input_create(input_action.analogue_rx,	noone, gp_axisrh, noone);
	input_create(input_action.analogue_ry,	noone, gp_axisrv, noone);
	// select is used to disconnect a controller

	/* We have initialized all of our input actions and given them keyboard and gamepad keys.

	Now, we can create our input manager object, which will be the mastermind that pulls everything together.

	Go ahead and open up o_input_manager, and take a look at its "Begin Step" event!*/

	instance_create_depth(0,0,0,o_input_manager);


}
