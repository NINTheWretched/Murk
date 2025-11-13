extends CharacterBody2D

const tile_size: Vector2 = Vector2(16, 16)

var rng = RandomNumberGenerator.new()

func _on_timer_timeout():
	print ("click")
	rng.randomize()
	var random_int = rng.randi_range(1, 4)
	print("Int:", random_int)
	if random_int == 1:
		_move(Vector2(0, -1))
	elif random_int == 2:
		_move(Vector2(0, 1))
	elif random_int == 3:
		_move(Vector2(-1, 0))
	elif random_int == 4:
		_move(Vector2(1, 0))

func _move(dir: Vector2):
	global_position += dir * tile_size
