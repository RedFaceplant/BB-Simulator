extends GraphNode

signal Wire(x, p)

var port


func _ready():
	pass # Replace with function body.


#used to store the port number, therefore multiple signals can come from different ports.
func flashPort(p):
	port = p


func _on_CheckButton_text_changed(new_text):
	emit_signal("Wire", float(new_text), port)
