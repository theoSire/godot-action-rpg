shader_type canvas_item;

uniform bool active = false;
uniform bool player = false;

void fragment() {
	vec4 previous_color = texture(TEXTURE, UV);
	vec4 blink_color;
	if (player == true) {
		vec4 white_color = vec4(1.0, 0, 0, previous_color.a);
		blink_color = white_color;
	} else {
		vec4 red_color = vec4(1.0, 1.0, 1.0, previous_color.a);
		blink_color = red_color;
	}
	vec4 new_color = previous_color;
	if (active == true) {
		new_color = blink_color;
	}
	COLOR = new_color;
}