/* Here we are, at the start of everything! o_init... The foundation!
The snowflake that creates an avalanche!

This is the first object created in the game. You can find it lying around in the
first room: rm_init.

This object is used to initialize everything else that's going to happen. Once everything
is initialized, it'll take us to the gameplay room.

The first thing we have to initialize in this project is our inputs.
So we're going to do that in our convenient init_inputs() script. Let's take a
look inside that script! */

init_inputs();

globalvar PLAYER_COLORS;
PLAYER_COLORS[0] = c_aqua;
PLAYER_COLORS[1] = c_yellow;
PLAYER_COLORS[2] = c_fuchsia;
PLAYER_COLORS[3] = c_lime;

room_goto(rm_gameplay);