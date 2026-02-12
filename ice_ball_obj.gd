extends RigidBody2D


func _ready() -> void:
	pass# Replace with function body.


func destroy_obj():
	queue_free()

func _on_area_2d_body_entered(body: Node2D) -> void:
	print("Something touched Ice Ball: ", body.name)
	if body.is_in_group("attacker"):
		if body.has_method("slow"):
			body.slow()
	destroy_obj()

func _process(_delta):
	if self.get_linear_velocity().x < 0:
		$Sprite2D.flip_h = true
	else:
		$Sprite2D.flip_h = false
