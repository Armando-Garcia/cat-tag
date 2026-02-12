extends Label

@export var trap_resource: trap_power

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

func _process(_delta: float) -> void:
	if trap_resource:
		var current_count = trap_resource.active_traps.size()
		var max_count = trap_resource.max_traps
		text = "Traps Left: " + str(max_count - current_count)
