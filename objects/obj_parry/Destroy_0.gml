if (hasParried) {
	instance_create_depth(x, obj_delta.y - 25, -1000, obj_perfect);
} else {
	instance_create_depth(x, obj_delta.y - 25, -1000, obj_miss);
}