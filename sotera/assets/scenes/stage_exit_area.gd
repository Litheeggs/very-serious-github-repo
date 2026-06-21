extends Area2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	# Connect signals
	body_entered.connect(_on_body_entered)
	body_exited.connect(_on_body_exited)
	
func _on_body_entered(body: Node2D):
	print("entered area")

func _on_body_exited(body: Node2D):
	print("exited area")
