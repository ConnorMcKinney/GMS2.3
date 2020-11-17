/// @description Move Around
xAxis = gamepad_axis_value(padID, gp_axislh);
yAxis = gamepad_axis_value(padID, gp_axislv);
rightBumper = gamepad_button_check_pressed(padID, gp_shoulderr);
leftBumper = gamepad_button_check_pressed(padID, gp_shoulderl);

x += xAxis * moveSpeed;
y += yAxis * moveSpeed;

if(rightBumper) {
	mySprite = clamp(mySprite + 1, 0, array_length_1d(mySprites) - 1);
	sprite_index = mySprites[mySprite];
}
if(leftBumper) {
	mySprite = clamp(mySprite - 1, 0, array_length_1d(mySprites) - 1);
	sprite_index = mySprites[mySprite];
}