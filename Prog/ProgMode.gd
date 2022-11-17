extends Control

signal TheVariables(balue)

var listOfNodes = ["Add", "And", "Bulb", "Display", "Gauge", "Joystick", "Multiply",
		"Subtract", "Switch", "SR Latch", "XOR"]

onready var button = load("res://Prog/SidebarButton.tscn")


# Called when the node enters the scene tree for the first time.
func _ready():
	if get_parent().name == "Program":
		var _dumpVar = self.connect("TheVariables", get_tree().get_root().get_node("./Main/TabContainer/Run/Viewport/RunMode"), "_incoming_motors")
	
	for b in listOfNodes:
		var newButton = button.instance()
		$Sidebar/VBox.add_child(newButton)
		newButton.buttonSetup(b, $Graph)

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func _motor(obj):
	emit_signal("TheVariables", obj)
