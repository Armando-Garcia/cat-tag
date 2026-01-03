class_name Powerup
extends Resource

@export var powerup_name: String = "Null Powerup"
@export var powerup_scene:PackedScene

var move_allowed: bool = true

func use_power(_player: CharacterBody2D, _dir: Vector2):
	pass
