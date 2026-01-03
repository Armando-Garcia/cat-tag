extends Powerup
class_name pounce_move

@export var pounce_distance = 2600
var pounce_allowed: bool = true

func use_power(player: CharacterBody2D, dir: Vector2):
	move_allowed = false
	if dir == Vector2.ZERO:
		dir = Vector2.RIGHT if player.scale.x > 0 else Vector2.LEFT
	
	print(dir)
	
	var target_velocity = dir * pounce_distance
	var pounce_accel = 2000.0
	var move_lockout_timer = player.get_tree().create_timer(0.2)
	var cd_timer = player. get_tree().create_timer(1.0)
	
	if pounce_allowed:
		player.velocity = player.velocity.move_toward(target_velocity, pounce_accel)
		print("Pounced towards" ,player.velocity)
		pounce_allowed = false
		cd_timer.timeout.connect(_on_cd_timer_finished)
	
	move_lockout_timer.timeout.connect(_on_pounce_finished)

func _on_pounce_finished():
	move_allowed = true
	print("Movement Unlocked")
	

func _on_cd_timer_finished():
	pounce_allowed = true
	print("Pounce Allowed Again")
