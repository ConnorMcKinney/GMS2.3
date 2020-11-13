/* This is a simple player object. It just moves around in response to inputs! */

move_speed		= (500/room_speed); // This is the player's baseline move speed.
move_direction	= 0;				// This is the direction the player will move. This value will change as we hit different inputs.
radius			= 50;				// This is used to draw the player as a circle.

player_id		= 0;				// Here's the important variable: the PLAYER ID!

alarm[0] = 3;
keyboard = true;

/* Each player object has a "player id," which corresponds to a slot in our PLAYER_GAMEPAD_IDS list.

For example, a player with ID of 3 will look at slot 3 in the list.

So, how does this player object actually read the inputs for its slot? Let's pop into the step event and see! */