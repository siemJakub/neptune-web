shader_type spatial;
render_mode cull_disabled;

const float RADIUS_GALLE = 67.522;
const float RADIUS_LEVERRIER = 53.200 + 24.622;
const float RADIUS_LASSELL = 57.200 + 24.622;
const float RADIUS_ARAGO = 57.300 + 24.622;
const float RADIUS_ADAMS = 62.932 + 24.622;
const float RADIUST[5] = float[5] (RADIUS_GALLE, RADIUS_LEVERRIER, RADIUS_LASSELL, RADIUS_ARAGO, RADIUS_ADAMS);

const float WIDTH_GALLE  = 2.0;
const float WIDTH_LEVERRIER = 0.113;
const float WIDTH_LASSELL = 4.0;
const float WIDTH_ARAGO = 0.1;
const float WIDTH_ADAMS = 0.05;
const float WIDTHT[5] = float[5](WIDTH_GALLE, WIDTH_LEVERRIER, WIDTH_LASSELL, WIDTH_ARAGO, WIDTH_ADAMS );

float _calcRadiusToPlane(float input){
	return (0.5 * input ) / 87.554;
}

void fragment() {
	float dist = length(UV - vec2(0.5));
	
	for (int i = 0; i < 5; i++) {
		if( dist >= _calcRadiusToPlane(RADIUST[i]) - _calcRadiusToPlane(WIDTHT[i]) && dist < _calcRadiusToPlane(RADIUST[i]) ){
			ALBEDO = vec3(1.0, 1.0, 1.0);
			EMISSION = vec3(1, 1, 1);
			ALPHA = 1.0;
			break;
		}
		else {
			continue;
		}
	}
	
	//if (dist > RADIUS - WIDTH && dist < RADIUS) {
		//float line_distance = (RADIUS - dist) / (WIDTH);
	//	float line_distance_a = (RADIUS - dist) / (WIDTH);
	//	float line_distance_b = (RADIUS - dist - WIDTH) / (WIDTH);
	//	float a = line_distance < 0.5? line_distance_a: line_distance_b;
	//	
	//	ALBEDO = vec3(1.0, 1.0, 1.0);
	//	EMISSION = vec3(1, 1, 1);
	//	ALPHA = 1.0;
	//} else {
	//	ALPHA = 0.0;
	//}
}