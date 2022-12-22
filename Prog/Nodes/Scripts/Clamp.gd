extends GraphNode

signal Wire(x, p)

var port
var min_value
var max_value
var value = 0


func _ready():
	_on_LineEdit_text_changed("SUPRISE!!")


func updateOutput():
	var output = clamp(value,min_value,max_value)
	emit_signal("Wire", output, port)


func _wire(x, p):
	value = x
	updateOutput()


# Used to store the port number, therefore multiple signals can come from different ports.
func flashPort(p):
	port = p
	updateOutput()


func _on_LineEdit_text_changed(new_text):
	min_value = int($Master/Control/Min.text)
	max_value = int($Master/Control2/Max.text)
	updateOutput()
