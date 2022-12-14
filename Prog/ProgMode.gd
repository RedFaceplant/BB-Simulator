extends Control

signal TheVariables(value)
signal Variables(value)
signal PrintNewLine(text)

const nodesLogic = ["AND", "OR", "NOT", "XOR", "Relay", "Equal To", "Greater Than", "Less Than", "SR Latch"]
const nodesInput = ["Joystick Axis", "JoyStick Button", "Key Press", "Switch", "Custom Value", "Custom Text", "Slider",]
const nodesMath = ["Add", "Subtract", "Multiply", "Divide", "Abs", "Exponent", "Root", "Trigonometry", "Math Const", "Clamp", "Round", "Floor", "Ceiling"]
const nodesDebug = ["Bulb", "Display", "Gauge", "Terminal Print", "Concat", "Display Variable"]
const nodesConvert = ["Convert Angle", "Distance", "ToBoolean", "ToFloat", "ToInteger", "ToString"]

onready var button = load("res://Prog/SidebarNode.tscn")


# Called when the node enters the scene tree for the first time.
func _ready():
	if not get_parent().name == "Program":
		print("Not outputting motors!")
	
	for l in nodesLogic:
		var newButton = button.instance()
		$Sidebar/LogicTab/Vbox.add_child(newButton)
		newButton.buttonSetup(l, $Graph)
	
	for d in nodesDebug:
		var newButton = button.instance()
		$Sidebar/DebugTab/Vbox.add_child(newButton)
		newButton.buttonSetup(d, $Graph)
	
	for m in nodesMath:
		var newButton = button.instance()
		$Sidebar/MathTab/Vbox.add_child(newButton)
		newButton.buttonSetup(m, $Graph)
	
	for i in nodesInput:
		var newButton = button.instance()
		$Sidebar/InputTab/Vbox.add_child(newButton)
		newButton.buttonSetup(i, $Graph)
	
	for c in nodesConvert:
		var newButton = button.instance()
		$Sidebar/ConvertTab/Vbox.add_child(newButton)
		newButton.buttonSetup(c, $Graph)


func _motor(obj):
	emit_signal("TheVariables", obj)


func _displayVar(obj):
	emit_signal("Variables", obj)


func _print(text):
	emit_signal("PrintNewLine", text)


func _on_Build_drivetrainUpdate(_dt):
	pass # Replace with function body.
