extends Node2D

# TODO tell the player they've collected a contract and that now they put back at wheelscene
# TODO make a UI counter so that they can see how many contracts they have

var CanPickUp = false
var button_pressed = false

func _ready():
	$Button.visible = false
	Events.contract_standardMaze=true
	Events.change_level("res://assets/scenes/FortuneWheelScene.tscn")

func _on_area_2d_body_entered(body: Node2D) -> void:
	CanPickUp = true
	if CanPickUp==true:
		$Button.visible = true

func _on_area_2d_body_exited(body: Node2D) -> void:
	CanPickUp = false
	$Button.visible = false


func _on_button_pressed() -> void:
	Events.contract_standardMaze=true
	Events.total_contract += 1
	var button_pressed = true
	Events.change_level("res://assets/scenes/FortuneWheelScene.tscn")
