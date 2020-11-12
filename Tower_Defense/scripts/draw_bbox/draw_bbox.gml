function draw_bbox() {
	if(global.draw_bboxes){
		draw_rectangle(bbox_left, bbox_top, bbox_right, bbox_bottom, true);
		show_debug_overlay(true);
	}else{
		show_debug_overlay(false);
	}



}
