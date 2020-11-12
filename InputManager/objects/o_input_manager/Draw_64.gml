draw_set_font(fnt_regular);
draw_set_halign(fa_left);
draw_set_valign(fa_bottom);

var text_xdraw		= 10;
var text_xspacing	= 150;
var text_ydraw		= display_get_gui_height()-10;

draw_set_color(c_gray);
draw_text(text_xdraw, text_ydraw, "Player Gamepad IDs");
text_xdraw += 200;


for ( var player_id = 0; player_id < ds_list_size(PLAYER_GAMEPAD_IDS); player_id++){
	draw_set_color(PLAYER_COLORS[player_id]);
	draw_text(text_xdraw, text_ydraw, "Player " + string(player_id) + ": " + string(PLAYER_GAMEPAD_IDS[|player_id]));
	text_xdraw += text_xspacing;
}
