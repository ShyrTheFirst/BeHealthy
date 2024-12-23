extends Control

enum Visibility_mode {
	ALWAYS, ## Always visible
	TOUCHSCREEN_ONLY, ## Visible on touch screens only
}
## If the joystick is always visible, or is shown only if there is a touchscreen
@export var visibility_mode := Visibility_mode.ALWAYS

## If true, the joystick uses Input Actions (Project -> Project Settings -> Input Map)
@export var use_input_actions := true

@export var action := "Interagir"

# FUNCTIONS

func _ready() -> void:
	if not DisplayServer.is_touchscreen_available() and visibility_mode == Visibility_mode.TOUCHSCREEN_ONLY :
		hide()



func _is_point_inside_joystick_area(point: Vector2) -> bool:
	var x: bool = point.x >= global_position.x and point.x <= global_position.x + (size.x * get_global_transform_with_canvas().get_scale().x)
	var y: bool = point.y >= global_position.y and point.y <= global_position.y + (size.y * get_global_transform_with_canvas().get_scale().y)
	return x and y

func _input(event: InputEvent) -> void:
	if event is InputEventScreenTouch:
		if event.pressed:
			if _is_point_inside_joystick_area(event.position):
				Input.action_press(action)
				get_viewport().set_input_as_handled()
				release()

func release():
	Input.action_release(action)
