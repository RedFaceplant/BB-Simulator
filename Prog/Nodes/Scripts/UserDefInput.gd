extends GraphNode
const type = "Custom Value"
export var data = {}

signal Wire(x, p)

var port
var text = ""

func _ready():
	pass # Replace with function body.


func updateOutput():
	emit_signal("Wire", float(text), port)


# Used to store the port number, therefore multiple signals can come from different ports.
func flashPort(p):
	port = p
	updateOutput()


func _on_CheckButton_text_changed(new_text):
	text = new_text
	updateOutput()
