/* Here's where the rubber meets the road! Or the spaceship meets space, or whatever it is
you have going on in your game. We're going to use our input_held() script to see what this
player intends to do -- move up, down, left, or right. Then, we'll apply that movement! */

var intended_x_movement = input_held(player_id, input_action.right)	-input_held(player_id, input_action.left);
var intended_y_movement = input_held(player_id, input_action.down)	-input_held(player_id, input_action.up);

/* Looking at the above, you may notice that we are doing something a bit goofy. We're subtracting the
left input from the right, and the up from the down. That's because Game Maker treats "true" as 1 and "false" as 0.
So we can do a little math trick to condense our code! */

if intended_x_movement != 0 || intended_y_movement != 0 {
	
	/* Once we know that the player intends to move, we can get their
	intended movement direction, and then use those handy lengthdir_x and lengthdir_y
	functions to move the player a certain distance in a certain direction. */
	
	move_direction = point_direction(0,0,intended_x_movement,intended_y_movement);
	x += lengthdir_x(move_speed, move_direction);
	y += lengthdir_y(move_speed, move_direction);
}

/* Cool! We now have a player that is reading inputs using our input_action system, based on their
player ID. The last step is to make sure that we actually have the right number of players
spawned in the world. For that, we'll use our o_gameplay_manager object. Let's go take a look at
the step event of o_gameplay_manager! */