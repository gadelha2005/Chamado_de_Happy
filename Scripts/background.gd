extends ParallaxBackground

class_name Background

@onready var _clouds: Array = [
	%CloudsT1, %CloudsT2, %CloudsT3, %CloudsT4, %CloudsT5, %CloudsT6, %CloudsT7
]

var _speed_values: Array[float] = [
	16.0, 16.0, 4.0, 4.0, 8.0, 8.0, 12.0,
]

func _physics_process(delta: float) -> void:
	var i: int = 0
	for cloud in _clouds:
		cloud.motion_offset.x -= _speed_values[i] * delta
		i += 1
