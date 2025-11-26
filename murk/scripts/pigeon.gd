extends CharacterBody2D

const tile_size: Vector2 = Vector2(16, 16)

var rng = RandomNumberGenerator.new()

#func _ready() -> void:
	#queue_free()

func _on_move_timeout():
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
