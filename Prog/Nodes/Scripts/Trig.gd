extends GraphNode
const type = "Trigonometry"
export var data = {}
signal Wire(x, p)
const optionsArray = ["Sin", "Cos", "Tan", "Arcsin", "Arccos", "Arctan"]

var port
var A = 0
var functionsArray


func _ready():
	var i = 0
	for a in optionsArray: # Pushes all options in optionsArray into the dropdown
		$OptionButton.add_item(a, i)
		i += 1


func _wire(x, _p):
		A = x
		updateOutput()


func updateOutput():
	functionsArray = [sin(A),cos(A),tan(A),asin(A),acos(A),atan(A)]
	var output = functionsArray[$OptionButton.selected]
	emit_signal("Wire", output, port)


# Used to store the port number, therefore multiple signals can come from different ports.
func flashPort(p):
	port = p
	updateOutput()


func _on_OptionButton_item_selected(_index):
	updateOutput()
