extends GraphNode
const type = "Display Variable"
export var data = {}

signal displayVar(obj)
var text = ""
var output
var varName = "varName"


func _ready():
	var _dummyVal = self.connect("displayVar", get_parent().get_parent(), "_displayVar")


func _wire(x, _p):
	if not str(output) == str(x):
		output = x
		updateOutput()


func updateOutput():
	emit_signal("displayVar", {"varName": varName, "value": output})


func _on_LineEdit_text_changed(new_text):
	varName = new_text
