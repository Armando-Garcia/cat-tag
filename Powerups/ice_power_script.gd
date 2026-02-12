extends Powerup
class_name ice_power

@export var ice_ball_scene: PackedScene
@export var power_cd: float = 3.0
var power_allowed: bool = true

func use_power(player: CharacterBody2D, _dir):
	var cd_timer = player. get_tree().create_timer(power_cd)
	var new_ice_ball = ice_ball_scene.instantiate()
	
	player.get_tree().root.add_child(new_ice_ball)
	
	if power_allowed:
		#Spawn in ice ball
		new_ice_ball.global_position = player.global_position
		# Shoot Ball with Velocity
		new_ice_ball.set_linear_velocity(Vector2(1600 * player.last_dir,0))
		print("Ice Ball towards" ,player.velocity)
		power_allowed = false
		cd_timer.timeout.connect(_on_cd_timer_finished)


func _on_cd_timer_finished():
	power_allowed = true
	print("Ice Ball Allowed")
