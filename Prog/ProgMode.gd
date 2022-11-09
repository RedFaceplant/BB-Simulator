extends Control

signal TheVariables(balue)

# Called when the node enters the scene tree for the first time.
func _ready():
	if get_parent().name == "Program":
		self.connect("TheVariables", get_tree().get_root().get_node("./Main/TabContainer/Run/Viewport/RunMode"), "_incoming_motors")

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func _motor(obj):
	emit_signal("TheVariables", obj)
