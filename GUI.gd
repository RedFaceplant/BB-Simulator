extends Node2D

# Called when the node enters the scene tree for the first time.
func _ready():
	pass

func _on_BuildButton_button_up():
	get_tree().change_scene("res://BuildMode.tscn")

func _on_ProgramButton_button_up():
	get_tree().change_scene("res://ProgMode.tscn")
	
func _on_RunButton_button_up():
	get_tree().change_scene("res://RunMode.tscn")
