/// @description Gamepad Detection

//Added Gamepad
if(async_load[? "event_type"] == "gamepad discovered") {
	with(instance_create_layer(room_width / 2, room_height / 2, "Instances", objPlayer)) {
		padID = async_load[? "pad_index"];
		gamepad_set_axis_deadzone(padID, .25);
	}
	CreateCameras();
}

//Removed Gamepad
if(async_load[? "event_type"] == "gamepad lost") {
	var controllerID = async_load[? "pad_index"];
	for(var i = 0; i < instance_number(objPlayer); ++i) {
		if(instance_find(objPlayer, i).padID == controllerID) {
			instance_destroy(instance_find(objPlayer, i));
			break;
		}
	}
	CreateCameras();
}







