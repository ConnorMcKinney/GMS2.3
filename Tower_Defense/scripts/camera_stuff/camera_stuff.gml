/// @description Create all the cameras
globalvar CAMERAS;
CAMERAS = 0;

function create_cameras() {
	view_enabled = true;
	playerCount = instance_number(oCharacter);

	var width = 1024, height = 768, scale = 1;

	//Destroy previous cameras
	if(is_undefined(global.CAMERAS) == false) {
		for(var i = 0; i < array_length_1d(global.CAMERAS); ++i) {
			camera_destroy(global.CAMERAS[i]);
		}
	}
	global.CAMERAS = undefined;

	view_visible[0] = false;
	view_visible[1] = false;
	view_visible[2] = false;
	view_visible[3] = false;

	for(var i = 0; i < playerCount; ++i) {
		player = instance_find(oCharacter, i);
		view_visible[i] = true;
	
		global.CAMERAS[i] = camera_create_view(0, 0, width, height, 0, player, -1, -1, width, height);
		view_set_camera(i, global.CAMERAS[i]);
	
		//4 Players
		if(i == 0) {
			view_xport[i] = 0;
			view_yport[i] = 0;
			view_wport[i] = width;
			view_hport[i] = height;
		}
		if(i == 1) {
			view_set_xport(0, 0);
			view_set_yport(0, 0);
			view_set_wport(0, width);
			view_set_hport(0, height / 2);
			camera_set_view_size(global.CAMERAS[0], width, height / 2);
		
			view_set_xport(1, 0);
			view_set_yport(1, height / 2);
			view_set_wport(1, width);
			view_set_hport(1, height / 2);
			camera_set_view_size(global.CAMERAS[1], width, height / 2);
		}
		if(i == 2) {
			//First player gets a big screen
			view_set_xport(0, 0);
			view_set_yport(0, 0);
			view_set_wport(0, width);
			view_set_hport(0, height / 2);
			camera_set_view_size(global.CAMERAS[0], width, height / 2);
		
			view_set_xport(1, 0);
			view_set_yport(1, height / 2);
			view_set_wport(1, width / 2);
			view_set_hport(1, height / 2);
			camera_set_view_size(global.CAMERAS[1], width / 2, height / 2);
		
			view_set_xport(2, width / 2);
			view_set_yport(2, height / 2);
			view_set_wport(2, width / 2);
			view_set_hport(2, height / 2);
			camera_set_view_size(global.CAMERAS[2], width / 2, height / 2);
		}
		if(i == 3) {
			view_set_xport(0, 0);
			view_set_yport(0, 0);
			view_set_wport(0, width / 2);
			view_set_hport(0, height / 2);
			camera_set_view_size(global.CAMERAS[0], width / 2, height / 2);
		
			view_set_xport(1, width / 2);
			view_set_yport(1, 0);
			view_set_wport(1, width / 2);
			view_set_hport(1, height / 2);
			camera_set_view_size(global.CAMERAS[1], width / 2, height / 2);
		
			view_set_xport(2, 0);
			view_set_yport(2, height / 2);
			view_set_wport(2, width / 2);
			view_set_hport(2, height / 2);
			camera_set_view_size(global.CAMERAS[2], width / 2, height / 2);
		
			view_set_xport(3, width / 2);
			view_set_yport(3, height / 2);
			view_set_wport(3, width / 2);
			view_set_hport(3, height / 2);
			camera_set_view_size(global.CAMERAS[3], width / 2, height / 2);
		}
	}

	window_set_size(width * scale, height * scale);
	surface_resize(application_surface, width * scale, height * scale);
}
