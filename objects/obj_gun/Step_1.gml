/// @description Happens before any step events 

// (begin step adds "weight" to the gun)
// follow the player around
x = obj_player.x;
y = obj_player.y+2;

// make gun follow the mouse
image_angle = point_direction(x, y, mouse_x, mouse_y);

firingDelay -= 1;
recoil = max(0, recoil-1);

if (mouse_check_button(mb_left)) && (firingDelay < 0) {
	recoil = 4;
	firingDelay = 20; // delay next bullet by at least 5 frames
	with(instance_create_layer(x, y, "Bullets", obj_bullet)) {
		speed = 5; // 25 ppf (pixels per frame)
		// use the gun angle (other) and add recoil
		direction = other.image_angle + random_range(-3, 3);
		image_angle = direction;
	}
}

// recoil effect
x -= lengthdir_x(recoil, image_angle);
y -= lengthdir_y(recoil, image_angle);

// orient the gun to where the mouse is facing
if (image_angle > 90 && image_angle < 270) {
	image_yscale = -1;
} else {
	image_yscale = 1;
}