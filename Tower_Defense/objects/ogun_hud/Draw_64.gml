/// @description Insert description here
// You can write your code in this editor
draw_sprite(sPistol, 0, x, y);
draw_set_color(c_black);
draw_text(x+4, y+4, string(ammo) + "/" + string(max_ammo)); //Draw item quantity
draw_set_color(c_white);