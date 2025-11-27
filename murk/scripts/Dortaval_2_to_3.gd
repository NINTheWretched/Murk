extends Area2D

signal world_changed(world_name)
var entered = false

@export var world_name = "world"

func _process(_delta):
	if entered == true:
		if Input.is_action_just_pressed("ui_accpet"):
			emit_signal("world_changed", world_name)
		get_tree().change_scene("res://Dortaval_3.tscn")


func _on_Area2D_body_entered(_body: PhysicsBody2D):
	entered = true

func _on_Area2D_body_exited(_body):
	entered = false
