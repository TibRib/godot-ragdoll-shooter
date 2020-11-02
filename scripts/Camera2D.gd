extends Camera2D

var zoom_pos = Vector2(0,0)
var zoom_value = 1.0
const ZOOM_STEP = 0.2

func _ready():
	zoom_value = self.zoom.x

func _input(event):
	if event.is_pressed():
		if event.button_index == BUTTON_WHEEL_UP:
			#zoom_pos = get_global_mouse_position() mouse pos
			if zoom_value-ZOOM_STEP > 0:
				zoom_value -= ZOOM_STEP * zoom_value;
				setZoom(zoom_value)
		if event.button_index == BUTTON_WHEEL_DOWN:
			#zoom_pos = get_global_mouse_position() mouse pos
			if zoom_value+ZOOM_STEP < 1:
				zoom_value += ZOOM_STEP * zoom_value;
				setZoom(zoom_value)

func setZoom(zoom_value):
	self.zoom.x = zoom_value
	self.zoom.y = zoom_value
