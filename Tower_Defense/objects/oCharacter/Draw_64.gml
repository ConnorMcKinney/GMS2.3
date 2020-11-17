/// @description Insert description here
// You can write your code in this editor
draw_bbox();

for(i=0; i<player_stats.max_hp; i+=2){
	if(i <= player_stats.hp){
		draw_sprite(sHeart_full, 0, hud.heart_pos_x+hud.heart_pos_buffer*i, hud.heart_pos_y);
	}else if(i-1 <= player_stats.hp){
		draw_sprite(sHeart_half_full, 0, hud.heart_pos_x+hud.heart_pos_buffer*i, hud.heart_pos_y);
	}else{
		draw_sprite(sHeart_empty, 0, hud.heart_pos_x+hud.heart_pos_buffer*i, hud.heart_pos_y);
	}
}

//draw_set_color(c_black);
//draw_text(10, 10, "Coins: " + string(global.coins));
//draw_text(10, 30, "Level: "+ string(global.level));
//draw_text(10, 50, "HP: " + string(global.hp));
//draw_set_color(c_white);