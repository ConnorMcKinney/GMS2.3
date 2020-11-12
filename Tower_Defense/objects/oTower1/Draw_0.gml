/// @description Drawing + Target Selection
// You can write your code in this editor

if(dragging){
	draw_sprite_ext(sprite_index, image_index, x, y, 1, 1, 0, color, 1);	
}else if(in_shop){
	draw_self();
	draw_set_color(c_black);
	draw_text(x-15, y-55, name);
	draw_text(x-15, y-35, string(cost));
	draw_set_color(c_white)
}else{

	

	draw_self();
	hovered = false;
	if(global.selected == id or position_meeting(mouse_x, mouse_y, self)){
		draw_circle(x, y, range,true);
	}

	var en = instance_nearest(x, y, oEnemy);
	if(en != noone){
		if(point_distance(x, y, en.x, en.y) <= range + global.gridsize/2){
			if(!shooting){
				alarm[0] = 1;
				shooting = true;
			}
		
			objectToShoot = en;
			objectToShoot = en;
			if(global.selected == self or position_meeting(mouse_x, mouse_y, self)){
				draw_line(x, y, en.x, en.y);
			}
		}else{
			shooting = false;
			objectToShoot = noone;
		}

	}
}

