extends GraphNode
const type = "Slider"
export var data = {}

signal Wire(x, p)

var port
var min_value
var max_value


func _ready():
	pass # Replace with function body.


# Used to store the port number, therefore multiple signals can come from different ports.
func flashPort(p):
	port = p
	updateOutput()


func updateOutput():
	emit_signal("Wire", $HSlider.value, port)


func _on_HSlider_value_changed(value):
	updateOutput()


func _on_LineEdit_text_changed(new_text):
	min_value = int($"Control/Min".text)
	max_value = int($"Control2/Max".text)
	$HSlider.min_value = min_value
	$HSlider.max_value = max_value


# Verify, but I dont think this needs to be here
## Slider does not have an input wire
#func _wire(x, _p):
#	updateOutput()
