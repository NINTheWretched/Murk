extends Area2D

var health = 5
var damage = 1

func _health_print(_viewport, _event, _shape_idx):
	print (health)

func _input_event(_viewport, event, _shape_idx):
	if event.is_action_pressed("left_click"):
		health -= damage
		print(health)
		print ("Click!")
		if health <= 0:
			print("Dead!")
			get_parent().get_parent().queue_free()

#func _area_combat(area: Area2D) -> void:
