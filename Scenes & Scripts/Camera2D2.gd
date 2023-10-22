extends Camera2D

const MIN_ZOOM: float = 1
const MAX_ZOOM: float = 2
const ZOOM_INCREMENT: float = 0.5
const ZOOM_RATE: float = 1.0

var _target_zoom: float = 1
var gameResolution: Vector2 = Vector2(ProjectSettings.get_setting("display/window/size/viewport_width"), ProjectSettings.get_setting("display/window/size/viewport_height"))
var camera_position = Vector2()
# Called when the node enters the scene tree for the first time.
func _ready():
	var bg = get_parent().get_parent().get_node("BG").get_rect()
	
	limit_left = bg.position.x
	limit_top = bg.position.y
	limit_right = bg.size.x / 2
	limit_bottom = bg.size.y / 2


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var half_game_width = gameResolution.x * (zoom.x / 2)
	var half_game_height = gameResolution.y * (zoom.y / 2)
	
	position = camera_position
	
	camera_position.x = clamp(camera_position.x, limit_left + half_game_width, limit_right - half_game_width)
	camera_position.y = clamp(camera_position.y, limit_top + half_game_height, limit_bottom - half_game_height)
	
func _physics_process(delta: float) -> void:
	zoom = lerp(
		zoom,
		_target_zoom * Vector2.ONE,
		ZOOM_RATE * delta
		)
	set_physics_process(
		not is_equal_approx(zoom.x, _target_zoom)
	)
	

