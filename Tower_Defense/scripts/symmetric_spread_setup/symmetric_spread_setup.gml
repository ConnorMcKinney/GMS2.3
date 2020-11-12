function symmetric_spread_setup() {
	damage = 5;
	fire_rate = room_speed/2;
	automatic = true;

	can_pierce = false;
	pierce_max = 2;

	explode = false;

	projectiles = 3;
	projectile_speed = 10;
	projectile_spread_type = 1; //0=linear, 1=equal spacing, 2=randomspread
	projectile_spread_value = 20; //bounding cone. Included angle

	burst_fire = false;
	burst_delay= fire_rate/6;
	burst_amount = 3;
	burst_count = 1;


}
