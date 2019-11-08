var camera = view_camera[0];
if (point_in_rectangle(x, y,
		camera_get_view_x(camera) + 16, camera_get_view_y(camera) + 16,
		camera_get_view_x(camera) + camera_get_view_width(camera) - 16,
		camera_get_view_y(camera) + camera_get_view_height(camera) - 16)) {
	return true;
}