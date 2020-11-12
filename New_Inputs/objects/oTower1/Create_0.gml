/// @description Insert description here
// You can write your code in this editor
color = c_white;
placed = false;
dragging = false;
in_shop = true;

player_collide = true;

name = "Basic";
cost = 50;
range = 100;


damage = 10;
fire_rate = room_speed/1.5;
automatic = true;

can_pierce = true;
pierce_max = 2;
explode = false;
projectiles = 3;
projectile_speed = 3;
projectile_spread_type = 1; //0=linear, 1=equal spacing, 2=randomspread
projectile_spread_value = 30; //bounding cone. Included angle

burst_fire = true;
burst_delay= fire_rate/6;
burst_amount = 3;
burst_count = 1;


tower_level = 1;

collision = instance_create_layer(-1000, 0, "Instances", oTower_collision);



shooting = false;
objectToShoot = noone;