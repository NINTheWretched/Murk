extends Area2D

var entered = false

func _on_body_entered(_body: CharacterBody2D) -> void:
	entered = true


func _on_body_exited() -> void:
	entered = false

func _process(_body):
	if entered == true:
		print ("How did we get here?")
		get_tree().change_scene("res://Dortaval_3.tscn")
