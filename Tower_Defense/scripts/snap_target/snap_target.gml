function snap_target() {
	x = mouse_x;
	y = mouse_y;
	
	var xx = bbox_left/global.gridsize; //bbox_left / global.gridsize;
	var yy = bbox_bottom/global.gridsize; //bbox_top / global.gridsize;

	xx = floor(xx + 0.5);
	yy = floor(yy + 0.5);

	xx *= global.gridsize;
	yy *= global.gridsize;

	//show_debug_message(xx)
	//show_debug_message(yy)

	x = xx + (x - bbox_left);
	y = yy + (y - bbox_bottom)-1;

	//show_debug_message(string(x) + ", " + string(y));

	if(place_meeting(x, y, oRegion) or place_meeting(x, y, oTowerParent)){
		color = c_red;
	}else{
		color = c_white;
	}


}
