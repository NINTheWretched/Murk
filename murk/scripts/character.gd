extends CharacterBody2D

@onready var MovementCooldown:Timer=$MovementCooldown

var attack_length = 16
const tile_size: Vector2 = Vector2(16, 16)

func _physics_process(_delta: float) -> void:
	
	if MovementCooldown.time_left==0:
		if Input.is_action_pressed("ui_up") and !$up.is_colliding():
			_move(Vector2(0, -1))
			MovementCooldown.start(MovementCooldown.wait_time)
		elif Input.is_action_pressed("ui_down") and !$down.is_colliding():
			_move(Vector2(0, 1))
			MovementCooldown.start(MovementCooldown.wait_time)
		elif Input.is_action_pressed("ui_left") and !$left.is_colliding():
			_move(Vector2(-1, 0))
			MovementCooldown.start(MovementCooldown.wait_time)
		elif Input.is_action_pressed("ui_right") and !$right.is_colliding():
			_move(Vector2(1, 0))
			MovementCooldown.start(MovementCooldown.wait_time)

	if Input.is_action_just_pressed("arrow_key_up"):
		$attack.target_position = Vector2(0, -attack_length)
		$attack.force_raycast_update()
		if $attack.is_colliding():
			#print ($attack.get_collider())
			if $attack.get_collider() is Enemy:
				$attack.get_collider()._take_damage(1)

	if Input.is_action_just_pressed("arrow_key_down"):
		$attack.target_position = Vector2(0, +attack_length)
		$attack.force_raycast_update()
		if $attack.is_colliding():
			#print ($attack.get_collider())
			if $attack.get_collider() is Enemy:
				$attack.get_collider()._take_damage(1)

	if Input.is_action_just_pressed("arrow_key_left"):
		$attack.target_position = Vector2(-attack_length, 0)
		$attack.force_raycast_update()
		if $attack.is_colliding():
			#print ($attack.get_collider())
			if $attack.get_collider() is Enemy:
				$attack.get_collider()._take_damage(1)

	if Input.is_action_just_pressed("arrow_key_right"):
		$attack.target_position = Vector2(+attack_length, 0)
		$attack.force_raycast_update()
		if $attack.is_colliding():
			#print ($attack.get_collider())
			if $attack.get_collider() is Enemy:
				$attack.get_collider()._take_damage(1)


#timer node if timer node.time =0 can input something
#once something is input reset timer
func _move(dir: Vector2):
	global_position += dir * tile_size
