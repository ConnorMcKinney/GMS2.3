draw_set_font(fnt_regular);
draw_set_halign(fa_left);
draw_set_valign(fa_top);

draw_set_color(c_white);
draw_text(10, 10, string_hash_to_newline("Press Dpad buttons on a controller to use the controller.#Press WASD to switch player 1 to keyboard.#Use more controllers to add more players.#Press 'Select' or 'Back' on a controller to disconnect."));