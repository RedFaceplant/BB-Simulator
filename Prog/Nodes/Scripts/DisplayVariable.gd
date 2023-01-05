extends GraphNode
const type = "DisplayVariable"
export var data = {}

signal displayVar(obj)
var text = ""
var output
var varName = "varName"

func _ready():
	var _dummyVal = self.connect("displayVar", get_parent().get_parent(), "_displayVar")

func _wire(x, _p):
	output = x
	updateOutput()

func updateOutput():
	emit_signal("displayVar", {"varname": varName, "value": output})
	
func setMotor(newMotor):
	data.motor = newMotor

func _on_LineEdit_text_changed(new_text):
	varName = new_text
