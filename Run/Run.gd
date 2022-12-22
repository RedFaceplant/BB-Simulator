extends Control

signal incoming_motors

func _ready():
	pass

func _on_Program_TheVariables(value):
	emit_signal("incoming_motors", value)


func _on_Program_PrintNewLine(text):
	$DriverStation.addPrintLine(text)
