extends GraphNode

signal Wire(x, p)

var port
var min_value
var max_value
var value = 0

func _ready():
	_on_LineEdit_text_changed("SUPRISE!!")

#used to store the port number, therefore multiple signals can come from different ports.
func flashPort(p):
	port = p

func updateOutput():
	var output = clamp(value,min_value,max_value)
	emit_signal("Wire", output, port)

func _wire(x, p):
	value = x
	updateOutput()

func _on_LineEdit_text_changed(new_text):
	min_value = int($"Control/Min".text)
	max_value = int($"Control2/Max".text)
	updateOutput()