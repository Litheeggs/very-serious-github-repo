extends Node

var Total_contracts = 0
var Lives = 3

func _ready() -> void:
	Events.collect_contract.connect(increment_contracts)
	Events.loose_life.connect(take_damage)

func take_damage():
	Lives -= 1
	if Lives == 0:
		# Game Over. maybe do jump scare sceen then fade to black
		pass

func increment_contracts():
	Total_contracts += 1
