extends GraphNode

signal Wire(x, p)

var port
var output
var A = 0



func _ready():
	pass # Replace with function body.

func _wire(x, p):
	output = x
	updateOutput()
	
func updateOutput():
	emit_signal("Wire", str(output), port)
#used to store the port number, therefore multiple signals can come from different ports.
func flashPort(p):
	port = p


func _on_CheckButton_text_changed(new_text):
	output=new_text
	updateOutput()

