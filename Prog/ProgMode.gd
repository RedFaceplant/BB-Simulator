extends Control

signal TheVariables(value)

const nodesLogic = ["And", "Or", "Not", "XOR", "SR Latch"]
const nodesInput = ["Joystick", "Custom Value", "Switch"]
const nodesMath = ["Add", "Subtract", "Multiply", "Divide", "Abs"]
const nodesDebug = ["Bulb", "Display", "Gauge"]
const nodesConvert = [] #Temp until nodes added

onready var button = load("res://Prog/SidebarNode.tscn")


# Called when the node enters the scene tree for the first time.
func _ready():
	if get_parent().name == "Program":
		var _dumpVar = self.connect("TheVariables", get_tree().get_root().get_node("./Main/TabContainer/Run/Viewport/RunMode"), "_incoming_motors")
	
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
