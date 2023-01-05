extends Control

signal incoming_motors
signal incoming_variables

func _ready():
	pass

func _on_Program_TheVariables(value):
	emit_signal("incoming_motors", value)
	
func _on_Program_Variables(value):
	#emit_signal("incoming_variables", value)
	print(value)

func _on_Program_PrintNewLine(text):
	$DriverStation.addPrintLine(text)

func _on_Build_drivetrainUpdate(dt):
	pass # Replace with function body.
