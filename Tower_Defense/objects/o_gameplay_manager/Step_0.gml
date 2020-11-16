/* This is our last stop: the Gameplay Manager. If you open up our gameplay room,
called rm_gameplay, you will notice that this object is the only thing in that room.
That's because it's the only object we need!

Here in the step event, our Gameplay Manager will check how many players we have
and make sure that we've spawned the correct number of players. */

var num_players_spawned		= instance_number(oCharacter);
var num_players_connected	= ds_list_size(PLAYER_GAMEPAD_IDS);

if num_players_spawned < num_players_connected {
	/* In this case, we don't have enough player instances spawned in the world, based
	on how many input devices we have connected. So we need to spawn more players,
	and make sure we give them the proper IDs! */
	
	for ( var player_id_num = 0; player_id_num < ds_list_size(PLAYER_GAMEPAD_IDS); player_id_num++){
		/* This convenient spawn_player() script will let us spawn a player instance and
		assign them a player ID. If the player is already spawned, the script will do nothing! */
		spawn_player(player_id_num);
		
	
	}
}
else if num_players_spawned > num_players_connected {
	/* In this case, someone has disconnected. So we have to clean up the extra
	player instances that are no longer needed by despawning them. */
	
	for ( var player_id_num = num_players_spawned-1; player_id_num >= num_players_connected; player_id_num--){		
		despawn_player(player_id_num);
		
	}	
}

/* And that's it! I have set this project up so that it's using only two input devices: keyboard and gamepad.

My hope is that you can use this project as inspiration, or even just move the code into your own game,
which you are welcome to do! Once you learn it, you can to do all kinds of things with it. Things like:

- Include Joystick support for gamepads.
	Hint: Make a new global array called JOYSTICK_STATES, and use o_input_manager to update those states!
- Include on-screen virtual controls.
	Hint: Spawn virtual controls on-screen, then use o_input_manager to read them and update INPUT_STATE based on whether
		the player is touching them!
- Reserve slot 1 for keyboard always, so you can do keyboard + controller co-op with only one controller and one keyboard!
	Hint: Update o_input_manager to not replace slot 0 when a new gamepad is connected!

There are tons of things you can do with this system, and it has few enough moving parts that, with
a little bit of prodding and experimentation, you can get all kinds of great results from it.

I hope this was helpful, and good luck out there!

- Seth Coster
Butterscotch Shenanigans

*/