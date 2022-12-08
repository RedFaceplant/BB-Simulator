extends Control

signal TheVariables(value)

const nodesLogic = ["AND", "OR", "NOT", "XOR", "SR Latch"]
const nodesInput = ["Joystick", "Custom Value", "Switch"]
const nodesMath = ["Add", "Subtract", "Multiply", "Divide", "Abs", "Exponent", "Root", "Trigonometry", "Math Const"]
const nodesDebug = ["Bulb", "Display", "Gauge"]
const nodesConvert = [] #Temp until nodes added

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
	
#	for c in nodesConvert:
#		var newButton = button.instance()
#		$Sidebar/ConvertTab/Vbox.add_child(newButton)
#		newButton.buttonSetup(c, $Graph)


func _motor(obj):
	emit_signal("TheVariables", obj)
