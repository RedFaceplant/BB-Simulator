extends GraphNode

signal Wire(x, p)

var port
var min_value
var max_value


func _ready():
	pass # Replace with function body.


#used to store the port number, therefore multiple signals can come from different ports.
func flashPort(p):
	port = p

func updateOutput():
	emit_signal("Wire", $HSlider.value, port)

func _on_HSlider_value_changed(value):
	updateOutput()


func _on_LineEdit_text_changed(new_text):
	min_value = int($"Control/Min".text)
	max_value = int($"Control2/Max".text)
	$HSlider.min_value = min_value
	$HSlider.max_value = max_value

#slider does not have an input wire
func _wire(x, _p):
	updateOutput()
