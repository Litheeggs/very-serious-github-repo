extends Camera2D

@export var target : Node2D
@export var follow_speed := 0.65

func _ready() -> void:
	
	top_level = true
	if target:
		global_position = target.global_position
	

func _physics_process(delta: float) -> void:
	
	global_position = global_position.lerp(target.global_position, follow_speed * delta)
	
