extends Control

signal incoming_motors
var displayVars = []

onready var DisplayThing = load("res://Run/DisplayVariable.tscn")
onready var Hbox = $DriverStation/HBoxContainer

func _ready():
	pass


func _on_Program_TheVariables(value):
	emit_signal("incoming_motors", value)
	
  
func _on_Program_Variables(newVar):
	if not newVar.varName in displayVars:
		var newDisplay = DisplayThing.instance()
		Hbox.add_child(newDisplay)
		newDisplay.setUp(newVar.varName, newVar.value)
		displayVars.append(newVar.varName)
	else:
		Hbox.get_child( displayVars.find(newVar.varName)+2 ).updateValue(newVar.value)


func deleteVar(namex):
	Hbox.get_child( displayVars.find(namex)+2 ).queue_free()
	displayVars.erase(namex)


func _on_Program_PrintNewLine(text):
	$DriverStation.addPrintLine(text)


# Here for future use
func _on_Build_drivetrainUpdate(_dt):
	pass # Replace with function body.
