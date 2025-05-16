shader_type spatial;
render_mode cull_disabled;

const float RADIUS = 0.5;
const float WIDTH  = 0.001;

void fragment() {
	float dist = length(UV - vec2(0.5));

	float px_dist = length((UV - vec2(0.5)) / VIEWPORT_SIZE);

	if (dist > RADIUS - WIDTH && dist < RADIUS) {
		float line_distance = (RADIUS - dist) / (WIDTH);
		float line_distance_a = (RADIUS - dist) / (WIDTH);
		float line_distance_b = (RADIUS - dist - WIDTH) / (WIDTH);
		float a = line_distance < 0.5? line_distance_a: line_distance_b;

		ALBEDO = vec3(1.0, 1.0, 1.0);
		EMISSION = vec3(a, a, a);
		ALPHA = 0.5;
	} else {
		ALPHA = 0.0;
	}
}
