extends Powerup
class_name trap_power

@export var trap_scene: PackedScene
@export var max_traps: int = 2

var active_traps: Array[Node] = []

func use_power(player: CharacterBody2D, _dir: Vector2):
	var sprite = player.get_node("AnimatedSprite2D") # Adjust name to match your node
	var spawn_dir = Vector2.LEFT if sprite.flip_h else Vector2.RIGHT
	active_traps = active_traps.filter(func(trap): return is_instance_valid(trap))
	
	if active_traps.size() >= max_traps:
		pass
		print("Trap limit reached")
	else:
		print(active_traps.size())
		super.use_power(player,Vector2(0,0))
		var new_trap = trap_scene.instantiate()
	
		if "use_num" in new_trap:
			new_trap.use_num = max_traps
	
		new_trap.global_position = player.global_position
		if new_trap.has_method("use_power"):
			new_trap.direction = spawn_dir
	
		player.get_tree().root.add_child(new_trap)
		active_traps.append(new_trap)
