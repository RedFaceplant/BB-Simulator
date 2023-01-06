extends GraphNode
const type = "Switch"
export var data = {}

signal Wire(x, p)

var port


func _ready():
	pass # Replace with function body.


func _on_CheckButton_toggled(button_pressed):
	emit_signal("Wire", button_pressed, port)


# Used to store the port number, therefore multiple signals can come from different ports.
func flashPort(p):
	port = p
	emit_signal("Wire", $CheckButton.pressed, port)
