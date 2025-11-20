extends CharacterBody2D

const tile_size: Vector2 = Vector2(16, 16)

var rng = RandomNumberGenerator.new()

func _on_timer_timeout():
	print ("tick")
	rng.randomize()
	var random_int = rng.randi_range(1, 4)
	print("Int:", random_int)
	if random_int == 1 and !$up.is_colliding():
		_move(Vector2(0, -1))
	elif random_int == 2 and !$down.is_colliding():
		_move(Vector2(0, 1))
	elif random_int == 3 and !$left.is_colliding():
		_move(Vector2(-1, 0))
	elif random_int == 4 and !$right.is_colliding():
		_move(Vector2(1, 0))

func _move(dir: Vector2):
	global_position += dir * tile_size

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
			queue_free()
